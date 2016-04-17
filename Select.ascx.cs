/*
' Copyright (c) 2016  JoopSoft
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using DotNetNuke.Entities.Users;
using JS.Modules.JSImageRotator.Components;
using DotNetNuke.Services.Exceptions;
using System.Web.UI.WebControls;
using DotNetNuke.UI.Utilities;
using DotNetNuke.Services.Localization;
using System.Collections.Generic;
using System.IO;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace JS.Modules.JSImageRotator
{
    /// -----------------------------------------------------------------------------
    /// <summary>   
    /// The Edit class is used to manage content
    /// 
    /// Typically your edit control would be used to create new content, or edit existing content within your module.
    /// The ControlKey for this control is "Edit", and is defined in the manifest (.dnn) file.
    /// 
    /// Because the control inherits from JSImageRotatorModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Select : JSImageRotatorModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Implement your edit logic for your module
                if (!Page.IsPostBack)
                {
                    var ic = new ImageController();
                    var i = ic.GetImages(ModuleId);
                    var il = ic.GetLists(ModuleId);
                    var dbi = new List<Images>();
                    foreach (var lst in il)
                    {
                        lstImageLists.Items.Add(lst.ListName);
                    }
                    foreach (var img in i)
                    {
                        if (img.ListsIn != null)
                        {

                            if (img.ListsIn.Contains(lstImageLists.SelectedValue) && lstImageLists.SelectedItem != null)
                            {
                                dbi.Add(img);
                            }
                        }
                    }
                    lnkAdd.NavigateUrl = EditUrl("AddImage");
                    lnkEdit.NavigateUrl = EditUrl();
                    rptImageList.DataSource = dbi;
                    rptImageList.DataBind();
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Generate();
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void lstImageLists_SelectedIndexChanged(object sender, EventArgs e)
        {
            var ic = new ImageController();
            var i = ic.GetImages(ModuleId);
            var dbi = new List<Images>();
            foreach (var img in i)
            {
                if (img.ListsIn.Contains(lstImageLists.SelectedValue))
                {
                    dbi.Add(img);
                }
            }
            rptImageList.DataSource = dbi;
            rptImageList.DataBind();
        }

        protected void btnDeleteList_Click(object sender, EventArgs e)
        {
            pnlConfirmDelete.Visible = true;
            pnlConfirmDelete.CssClass = "dnnFormItem popup warning";
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            int listId = 0;
            var ic = new ImageController();
            var ai = ic.GetImages(ModuleId);
            var il = ic.GetLists(ModuleId);
            foreach (var l in il)
            {
                if (l.ListName == lstImageLists.SelectedValue)
                {
                    listId = l.ImageListId;
                }
            }
            ic.DeleteList(listId, ModuleId);
            foreach (var i in ai)
            {
                if (i.ListsIn.Contains(lstImageLists.SelectedValue + ".json"))
                {
                    string remove = lstImageLists.SelectedValue + ".json, ";
                    i.ListsIn = i.ListsIn.Replace(remove, "");
                    ic.UpdateImage(i);
                }
            }
            lstImageLists.Items.Remove(lstImageLists.SelectedItem);
            lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = false;
            var dbi = new List<Images>();
            foreach (var img in ai)
            {
                if (img.ListsIn.Contains(lstImageLists.SelectedValue) && lstImageLists.SelectedValue != "")
                {
                    dbi.Add(img);
                }
            }
            pnlConfirmDelete.Visible = false;
            rptImageList.DataSource = dbi;
            rptImageList.DataBind();
            bool listPresent = false;
            il = ic.GetLists(ModuleId);
            foreach (var lst in il)
            {
                listPresent = true;
            }
            if (!listPresent)
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = false;
        }

        protected void Generate()
        {
            var ic = new ImageController();
            var il = ic.GetImages(ModuleId);
            List<ImageJ> Slides = new List<ImageJ>();
            foreach (var img in il)
            {
                if (img.ListsIn.Contains(lstImageLists.SelectedValue + ".json"))
                {
                    ImageJ li = new ImageJ();
                    li.Title = img.ImageTitle;
                    li.Description = img.ImageDescription;
                    li.Photographer = img.ImagePhotographer;
                    li.Contact = img.ImageContact;
                    string src = img.ImageUrl.Remove(0, 1);
                    li.src = src;
                    Slides.Add(li);
                }
            }
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
            if (File.Exists(Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Slides.json")))
            {
                File.Delete(Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Slides.json"));
            }
            using (FileStream fs = File.Open((Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Slides.json")), FileMode.CreateNew))
            using (StreamWriter sw = new StreamWriter(fs))
            using (JsonWriter jw = new JsonTextWriter(sw))
            {
                jw.Formatting = Formatting.Indented;
                JsonSerializer serializer = new JsonSerializer();
                serializer.Serialize(jw, Slides, typeof(ImageJ));
            }
            string path = Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Slides.json");
            string str;
            using (StreamReader sreader = new StreamReader(path))
            {
                str = sreader.ReadToEnd();
            }

            File.Delete(path);

            using (StreamWriter swriter = new StreamWriter(path, false))
            {
                str = "\"slides\":" + Environment.NewLine + str;
                str = "{" + Environment.NewLine + str;
                swriter.Write(str);
            }
            string appendText = Environment.NewLine + "}";
            File.AppendAllText(Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Slides.json"), appendText);
        }

    }
}