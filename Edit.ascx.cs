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
                    lnkSelect.NavigateUrl = EditUrl("Select");
                    var ic = new ImageController();
                    var il = ic.GetLists(ModuleId);
                    foreach (var lst in il)
                    {
                        lstSelectList.Items.Add(lst.ListName);
                        btnShowSelectList.Visible = true;
                    }
                    var i = ic.GetImages(ModuleId);
                    bool allSelected = true;
                    foreach (var img in i)
                    {
                        if (lstSelectList.SelectedItem != null)
                        {
                            if (img.ListsIn.Contains(lstSelectList.SelectedValue + ".json, "))
                            {
                                img.IsSelected = true;
                            }
                            else
                            {
                                img.IsSelected = false;
                            }
                        }

                        ic.UpdateImage(img);
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
                var lnkDelete = e.Item.FindControl("lnkDelete") as LinkButton;
                lnkDelete.CommandArgument = i.ImageId.ToString();
                ClientAPI.AddButtonConfirm(lnkDelete, Localization.GetString("ConfirmDelete", LocalResourceFile));
            }
        }

        protected void cbSelect_CheckedChanged(object sender, EventArgs e)
        {
            var ic = new ImageController();
            bool allChecked = true;
            foreach (RepeaterItem ri in rptImageList.Items)
            {
                var imgId = ri.FindControl("ImgId") as Label;
                var i = ic.GetImage(Convert.ToInt32(imgId.Text), ModuleId);
                var cbSelect = ri.FindControl("cbSelect") as CheckBox;
                i.IsSelected = cbSelect.Checked;
                ic.UpdateImage(i);
                var ai = ic.GetImages(ModuleId);
                foreach (var ci in ai)
                {
                    if (!cbSelect.Checked)
                    {
                        allChecked = false;
                        break;
                    }
                }
            }
            cbSelectAll.Checked = allChecked;
            lblListAdded.Text = "";
        }

        //protected bool Generate()
        //{
        //    if (File.Exists(Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + txtFileName.Text.Trim() + ".json")))
        //    {
        //        if (cbOverwrite.Checked)
        //        {
        //            File.Delete(Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + txtFileName.Text.Trim() + ".json"));
        //        }
        //        else
        //        {
        //            lblOverwriteError.Text = "The File Already Exists! If You want to overwrite it check the Overwrite Checkbox below!";
        //            return false;
        //        }
        //    }
        //    var ic = new ImageController();
        //    var il = ic.GetImages(ModuleId);
        //    List<ImageJ> Slides = new List<ImageJ>();
        //    foreach (var img in il)
        //    {
        //        ImageJ li = new ImageJ();
        //        li.ImageTitle = img.ImageTitle;
        //        li.ImageDescription = img.ImageDescription;
        //        li.ImagePhotographer = img.ImagePhotographer;
        //        li.ImageContact = img.ImageContact;
        //        li.ImageUrl = img.ImageUrl;
        //        Slides.Add(li);
        //    }
        //    DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
        //    using (FileStream fs = File.Open((Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + txtFileName.Text.Trim() + ".json")), FileMode.CreateNew))
        //    using (StreamWriter sw = new StreamWriter(fs))
        //    using (JsonWriter jw = new JsonTextWriter(sw))
        //    {
        //        jw.Formatting = Formatting.Indented;

        //        JsonSerializer serializer = new JsonSerializer();
        //        serializer.Serialize(jw, Slides, typeof(ImageJ));
        //    }
        //    return true;
        //}

        protected void cbSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            var ic = new ImageController();
            var i = ic.GetImages(ModuleId);
            foreach (var img in i)
            {
                img.IsSelected = cbSelectAll.Checked;
                ic.UpdateImage(img);
            }
            rptImageList.DataSource = ic.GetImages(ModuleId);
            rptImageList.DataBind();
            lblListAdded.Text = "";
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            var ic = new ImageController();
            var i = ic.GetImages(ModuleId);
            bool selectedImagePresent = false;
            bool lstExists = false;
            bool isNew = txtFileName.Visible;
            string listName;
            if (isNew)
            {
                listName = txtFileName.Text.Trim();
            }
            else
            {
                listName = lstSelectList.SelectedValue;
            }
            var il = ic.GetLists(ModuleId);
            foreach (var img in i)
            {
                if (img.IsSelected)
                {
                    selectedImagePresent = true;
                }
                if (img.IsSelected && img.ListsIn == null && listName != "")
                {
                    img.ListsIn += listName + ".json, ";
                    ic.UpdateImage(img);
                }
                else if (img.IsSelected && !img.ListsIn.Contains(listName + ".json") && listName != "")
                {
                    img.ListsIn += listName + ".json, ";
                    ic.UpdateImage(img);
                }
                if (!img.IsSelected && img.ListsIn != null)
                {
                    if (!img.IsSelected && img.ListsIn.Contains(listName + ".json"))
                    {
                        string remove = listName + ".json, ";
                        img.ListsIn = img.ListsIn.Replace(remove, "");
                        ic.UpdateImage(img);
                    }
                }
            }
            foreach (var lst in il)
            {
                if (lst.ListName == listName)
                {
                    lstExists = true;
                }
            }
            if (!selectedImagePresent && listName == "")
            {
                lblListAdded.Text = "No Image Selected and FileName field is empty";
            }
            else if (!selectedImagePresent && listName != "")
            {
                lblListAdded.Text = "No Image Selected";
            }
            else if (selectedImagePresent && listName == "")
            {
                lblListAdded.Text = "FileName field is empty";
            }
            else if (!lstExists)
            {
                var nil = new ImageLists
                {
                    ListName = listName,
                    ModuleId = ModuleId
                };
                ic.AddImageList(nil);
                lblListAdded.Text = "Added List " + listName + " with Selected Images";
                txtFileName.Text = "";
                btnShowSelectList.Visible = true;
                lstSelectList.Items.Add(listName);
            }
            else
            {
                lblListAdded.Text = "Updated List " + listName + " with Selected Images";
                txtFileName.Text = "";
            }
        }

        protected void btnShowAddNewList_Click(object sender, EventArgs e)
        {
            lblFileName.Visible = btnShowSelectList.Visible = txtFileName.Visible = true;
            lblSelectList.Visible = btnShowAddNewList.Visible = lstSelectList.Visible = btnDeleteList.Visible = false;
            btnGenerate.Text = "Add List";
            lblListAdded.Text = "";
        }

        protected void btnShowSelectList_Click(object sender, EventArgs e)
        {
            lblFileName.Visible = btnShowSelectList.Visible = txtFileName.Visible = false;
            lblSelectList.Visible = btnShowAddNewList.Visible = lstSelectList.Visible = btnDeleteList.Visible = true;
            btnGenerate.Text = "Update List";
            lblListAdded.Text = "";
        }

        protected void lstSelectList_SelectedIndexChanged(object sender, EventArgs e)
        {
            var ic = new ImageController();
            var ai = ic.GetImages(ModuleId);
            foreach (var i in ai)
            {
                if (i.ListsIn.Contains(lstSelectList.SelectedValue + ".json, "))
                {
                    i.IsSelected = true;
                }
                else
                {
                    i.IsSelected = false;
                }
                ic.UpdateImage(i);
            }
            rptImageList.DataSource = ic.GetImages(ModuleId);
            rptImageList.DataBind();
        }

        protected void btnDeleteList_Click(object sender, EventArgs e)
        {
            lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            int listId = 0;
            var ic = new ImageController();
            var ai = ic.GetImages(ModuleId);
            var il = ic.GetLists(ModuleId);
            foreach (var l in il)
            {
                if (l.ListName == lstSelectList.SelectedValue)
                {
                    listId = l.ImageListId;
                }
            }
            ic.DeleteList(listId, ModuleId);
            foreach (var i in ai)
            {
                if (i.ListsIn.Contains(lstSelectList.SelectedValue + ".json"))
                {
                    string remove = lstSelectList.SelectedValue + ".json, ";
                    i.ListsIn = i.ListsIn.Replace(remove, "");
                    ic.UpdateImage(i);
                }
            }
            lstSelectList.Items.Remove(lstSelectList.SelectedItem);
            lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = false;
            if (lstSelectList.Items.Count == 0)
            {
                lblFileName.Visible = txtFileName.Visible = true;
                lblSelectList.Visible = btnShowAddNewList.Visible = lstSelectList.Visible = btnDeleteList.Visible = btnShowSelectList.Visible = false;
                btnGenerate.Text = "Add List";
            }
            foreach (var img in ai)
            {
                if (img.ListsIn.Contains(lstSelectList.SelectedValue) && lstSelectList.SelectedValue != "")
                {
                    img.IsSelected = true;
                    ic.UpdateImage(img);
                }
            }
                rptImageList.DataSource = ic.GetImages(ModuleId);
                rptImageList.DataBind();
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = false;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            var ic = new ImageController();
            foreach (RepeaterItem ri in rptImageList.Items)
            {
                var imgId = ri.FindControl("ImgId") as Label;
                var imgTitle = ri.FindControl("txtTitle") as TextBox;
                var imgDescription = ri.FindControl("txtDescription") as TextBox;
                var imgPhotographer = ri.FindControl("txtPhotographer") as TextBox;
                var imgContact = ri.FindControl("txtContact") as TextBox;
                var btnEdit = ri.FindControl("btnEdit") as LinkButton;
                if (sender.Equals(btnEdit))
                {
                    if (!imgTitle.Enabled)
                    {
                        imgTitle.Enabled = imgDescription.Enabled = imgPhotographer.Enabled = imgContact.Enabled = true;
                        btnEdit.Text = "Save";
                    }
                    else
                    {
                        var i = ic.GetImage(Convert.ToInt32(imgId.Text), ModuleId);
                        i.ImageTitle = imgTitle.Text.Trim();
                        i.ImageDescription = imgDescription.Text.Trim();
                        i.ImagePhotographer = imgPhotographer.Text.Trim();
                        i.ImageContact = imgContact.Text.Trim();
                        ic.UpdateImage(i);
                        imgTitle.Enabled = imgDescription.Enabled = imgPhotographer.Enabled = imgContact.Enabled = false;
                        btnEdit.Text = "Edit";
                    }
                }
            }
        }
    }
}