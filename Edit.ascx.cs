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
    public partial class Edit : JSImageRotatorModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Implement your edit logic for your module
                if (!Page.IsPostBack)
                {
                    lnkAdd.NavigateUrl = EditUrl("AddImage");
                    var ic = new ImageController();
                    var i = ic.GetImages(ModuleId);
                    bool allSelected = true;
                    foreach (var img in i)
                    {
                        if (!img.IsSelected)
                        {
                            allSelected = false;
                        }
                        cbSelectAll.Checked = allSelected;
                    }
                    rptImageList.DataSource = ic.GetImages(ModuleId);
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
            var ic = new ImageController();
            var il = ic.GetImages(ModuleId);
            List<ImageJ> fileJ = new List<ImageJ>();
            foreach (var img in il)
            {
                ImageJ li = new ImageJ();
                li.ImageTitle = img.ImageTitle;
                li.ImageDescription = img.ImageDescription;
                li.ImagePhotographer = img.ImagePhotographer;
                li.ImageContact = img.ImageContact;
                li.ImageUrl = img.ImageUrl;
                fileJ.Add(li);
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(fileJ);
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
            File.WriteAllText((Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + txtFileName.Text.Trim() + ".json")), json);

            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        public void rptImages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                var ic = new ImageController();
                ic.DeleteImage(Convert.ToInt32(e.CommandArgument), ModuleId);
                rptImageList.DataSource = ic.GetImages(ModuleId);
                rptImageList.DataBind();
            }

        }

        protected void rptImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var i = (Images)e.Item.DataItem;
                var lnkEdit = e.Item.FindControl("lnkEdit") as HyperLink;
                var lnkDelete = e.Item.FindControl("lnkDelete") as LinkButton;
                var cbSelect = e.Item.FindControl("cbSelect") as CheckBox;
                lnkDelete.CommandArgument = i.ImageId.ToString();
                lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddImage", "iid=" + i.ImageId);
                ClientAPI.AddButtonConfirm(lnkDelete, Localization.GetString("ConfirmDelete", LocalResourceFile));
            }
        }

        protected void cbSelect_CheckedChanged(object sender, EventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            //{
            //    var ic = new ImageController();
            //    var i = ic.GetImage(ImageId, ModuleId);
            //    var cbSelect = e.Item.FindControl("cbSelect") as CheckBox;
            //    i.IsSelected = cbSelect.Checked;
            //    ic.UpdateImage(i);
            //}
        }

        protected void cbSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            var ic = new ImageController();
            var i = ic.GetImages(ModuleId);
            if (cbSelectAll.Checked)
            {
                foreach (var img in i)
                {
                    img.IsSelected = true;
                    ic.UpdateImage(img);
                }
            }
            else
            {
                foreach (var img in i)
                {
                    img.IsSelected = false;
                    ic.UpdateImage(img);
                }
            }
            rptImageList.DataSource = ic.GetImages(ModuleId);
            rptImageList.DataBind();
        }
    }
}