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
                    bool listPresent = false;
                    var ic = new ImageController();
                    var il = ic.GetLists(ModuleId);
                    foreach (var lst in il)
                    {
                        if (lst != null)
                        {
                            lstSelectList.Items.Add(lst.ListName);
                            listPresent = true;
                        }
                    }
                    if (!listPresent)
                    {
                        btnShowAddNewList.Enabled = lnkSelect.Enabled = false;
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
            Generate();
            AddUpdateList();
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
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
        }

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
        }

        protected void btnAddUpdateList_Click(object sender, EventArgs e)
        {
            AddUpdateList();
        }

        protected void btnShowAddNewList_Click(object sender, EventArgs e)
        {
            if (btnAddUpdateList.Text == "Create")
            {
                lblFileName.Visible = txtFileName.Visible = false;
                lblSelectList.Visible = lstSelectList.Visible = btnDeleteList.Visible = true;
                btnAddUpdateList.Text = "Update";
                btnAddUpdateList.CssClass = "btn btn-primary link-save";
                btnAddUpdateList.ToolTip = "Update List";
                lblListAdded.Text = "";
                lblPopUpIcon.CssClass = "";
                pnlPopUp.Visible = false;
                btnShowAddNewList.ToolTip = "Create New List";
                lblJsonTitle.Text = "Update Image Lists";
                btnSubmit.Text = "Update And Save";
            }
            else
            {
                lblFileName.Visible = txtFileName.Visible = true;
                lblSelectList.Visible = lstSelectList.Visible = btnDeleteList.Visible = false;
                btnAddUpdateList.Text = "Create";
                btnAddUpdateList.CssClass = "btn btn-primary link-add";
                btnAddUpdateList.ToolTip = "Create New List";
                lblListAdded.Text = "";
                lblPopUpIcon.CssClass = "";
                pnlPopUp.Visible = false;
                pnlPopUp.CssClass = "";
                btnShowAddNewList.ToolTip = "Edit Available Lists";
                lblJsonTitle.Text = "Create Image Lists";
                btnSubmit.Text = "Create And Save";
            }
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
            pnlConfirmDelete.Visible = true;
            pnlConfirmDelete.CssClass = "DeleteList dnnFormItem popup warning";
            lblConfirmIcon.CssClass = "popup-icon link-delete";
            lblConfirmDelete.Text = "Are you sure you want to Delete this List!";
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            var ic = new ImageController();
            if (pnlConfirmDelete.CssClass.Contains("DeleteList"))
            {
                int listId = 0;
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
                pnlConfirmDelete.Visible = false;
                pnlConfirmDelete.CssClass = "";
                lblConfirmIcon.CssClass = "";


                if (lstSelectList.Items.Count == 0)
                {
                    lblFileName.Visible = txtFileName.Visible = true;
                    lblSelectList.Visible = lstSelectList.Visible = btnDeleteList.Visible = false;
                    btnAddUpdateList.Text = "Create";
                    btnShowAddNewList.Enabled = lnkSelect.Enabled = false;
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
            else if (pnlConfirmDelete.CssClass.Contains("DeleteImage"))
            {
                ic.DeleteImage(Convert.ToInt32(lblDeleteImageID.Text), ModuleId);
                File.Delete(Server.MapPath(lblDeleteImageUrl.Text));
                rptImageList.DataSource = ic.GetImages(ModuleId);
                rptImageList.DataBind();
                pnlConfirmDelete.Visible = false;
                pnlConfirmDelete.CssClass = "";
                lblConfirmIcon.CssClass = "";
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            //lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = false;
            pnlConfirmDelete.Visible = false;
            pnlConfirmDelete.CssClass = "";
            lblConfirmIcon.CssClass = "";


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
                var tableRow = ri.FindControl("tableRow") as TableRow;
                var lnkDelete = ri.FindControl("lnkDelete") as LinkButton;
                if (sender.Equals(btnEdit))
                {
                    if (!imgTitle.Enabled)
                    {
                        imgTitle.Enabled = imgDescription.Enabled = imgPhotographer.Enabled = imgContact.Enabled = true;
                        tableRow.CssClass = "active";
                        lnkDelete.CssClass = "btn btn-primary link-cancel";
                        lnkDelete.ToolTip = "Cancel";
                        btnEdit.ToolTip = "Save";
                        btnEdit.CssClass = "btn btn-primary link-save";

                        pnlOverlay.Visible = true;
                        lblEditIcon.CssClass = "popup-icon link-edit";
                        //btnEdit.Text = "Save";
                        //btnEdit.Text = "<i class='fa fa-floppy-o'></i>";
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
                        tableRow.CssClass = "";
                        lnkDelete.CssClass = "btn btn-danger link-delete";
                        lnkDelete.ToolTip = "Delete";
                        btnEdit.ToolTip = "Edit";
                        btnEdit.CssClass = "btn btn-primary link-edit";

                        pnlOverlay.Visible = false;
                        lblEditIcon.CssClass = "";

                        //btnEdit.Text = "Edit";
                        //btnEdit.Text = "<i class='fa fa-pencil'></i>";
                    }
                }
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            var ic = new ImageController();
            foreach (RepeaterItem ri in rptImageList.Items)
            {
                var imgId = ri.FindControl("ImgId") as Label;
                var imgPreview = ri.FindControl("imgPreview") as Image;
                var imgTitle = ri.FindControl("txtTitle") as TextBox;
                var imgDescription = ri.FindControl("txtDescription") as TextBox;
                var imgPhotographer = ri.FindControl("txtPhotographer") as TextBox;
                var imgContact = ri.FindControl("txtContact") as TextBox;
                var btnEdit = ri.FindControl("btnEdit") as LinkButton;
                var tableRow = ri.FindControl("tableRow") as TableRow;
                var lnkDelete = ri.FindControl("lnkDelete") as LinkButton;
                if (sender.Equals(lnkDelete))
                {
                    if (!imgTitle.Enabled)
                    {
                        pnlConfirmDelete.Visible = true;
                        pnlConfirmDelete.CssClass = "DeleteImage dnnFormItem popup warning";
                        lblConfirmIcon.CssClass = "popup-icon link-delete";
                        lblConfirmDelete.Text = "Are you sure you want to Delete this Image!";
                        lblDeleteImageID.Text = imgId.Text;
                        lblDeleteImageUrl.Text = imgPreview.ImageUrl;
                    }
                    else
                    {
                        imgTitle.Enabled = imgDescription.Enabled = imgPhotographer.Enabled = imgContact.Enabled = false;
                        tableRow.CssClass = "";
                        lnkDelete.CssClass = "btn btn-danger link-delete";
                        lnkDelete.ToolTip = "Delete";
                        btnEdit.ToolTip = "Edit";
                        btnEdit.CssClass = "btn btn-primary link-edit";
                        //btnEdit.Text = "Edit";
                        //btnEdit.Text = "<i class='fa fa-pencil'></i>";
                    }
                    break;
                }
            }
        }

        protected void Generate()
        {
            var ic = new ImageController();
            foreach (RepeaterItem ri in rptImageList.Items)
            {
                var imgId = ri.FindControl("ImgId") as Label;
                var ci = ic.GetImage(Convert.ToInt32(imgId.Text), ModuleId);
                var cbSelect = ri.FindControl("cbSelect") as CheckBox;
                ci.IsSelected = cbSelect.Checked;
                ic.UpdateImage(ci);
            }
            var il = ic.GetImages(ModuleId);
            List<ImageJ> Slides = new List<ImageJ>();
            foreach (var img in il)
            {
                if (img.IsSelected)
                {
                    ImageJ li = new ImageJ();
                    li.ImageTitle = img.ImageTitle;
                    li.ImageDescription = img.ImageDescription;
                    li.ImagePhotographer = img.ImagePhotographer;
                    li.ImageContact = img.ImageContact;
                    li.ImageUrl = img.ImageUrl;
                    Slides.Add(li);
                }
            }
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
            if (File.Exists(Server.MapPath("~/DesktopModules/JSImageRotator/Json/Slides.json")))
            {
                File.Delete(Server.MapPath("~/DesktopModules/JSImageRotator/Json/Slides.json"));
            }
            using (FileStream fs = File.Open((Server.MapPath("~/DesktopModules/JSImageRotator/Json/Slides.json")), FileMode.CreateNew))
            using (StreamWriter sw = new StreamWriter(fs))
            using (JsonWriter jw = new JsonTextWriter(sw))
            {
                jw.Formatting = Formatting.Indented;
                JsonSerializer serializer = new JsonSerializer();
                serializer.Serialize(jw, Slides, typeof(ImageJ));
            }
            string path = Server.MapPath("~/DesktopModules/JSImageRotator/Json/Slides.json");
            string str;
            using (StreamReader sreader = new StreamReader(path))
            {
                str = sreader.ReadToEnd();
            }

            File.Delete(path);

            using (StreamWriter swriter = new StreamWriter(path, false))
            {
                str = "slides:" + Environment.NewLine + str;
                str = "{" + Environment.NewLine + str;
                swriter.Write(str);
            }
            string appendText = Environment.NewLine + "}";
            File.AppendAllText(Server.MapPath("~/DesktopModules/JSImageRotator/Json/Slides.json"), appendText);
        }

        protected void AddUpdateList()
        {
            var ic = new ImageController();
            bool selectedImagePresent = false;
            bool lstExists = false;
            bool isNew = txtFileName.Visible;
            string listName;
            foreach (RepeaterItem ri in rptImageList.Items)
            {
                var imgId = ri.FindControl("ImgId") as Label;
                var ci = ic.GetImage(Convert.ToInt32(imgId.Text), ModuleId);
                var cbSelect = ri.FindControl("cbSelect") as CheckBox;
                ci.IsSelected = cbSelect.Checked;
                ic.UpdateImage(ci);
            }
            var i = ic.GetImages(ModuleId);

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
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup warning";
                lblPopUpIcon.CssClass = "popup-icon link-warning";
                lblListAdded.Text = "No Image Selected and FileName field is empty";
            }
            else if (!selectedImagePresent && listName != "")
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup warning";
                lblPopUpIcon.CssClass = "popup-icon link-warning";
                lblListAdded.Text = "No Image Selected";
            }
            else if (selectedImagePresent && listName == "")
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup warning";
                lblPopUpIcon.CssClass = "popup-icon link-warning";
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
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup success";
                lblPopUpIcon.CssClass = "popup-icon link-success";
                lblListAdded.Text = "Added List " + listName + " with Selected Images";
                txtFileName.Text = "";
                lstSelectList.Items.Add(listName);
                btnShowAddNewList.Enabled = lnkSelect.Enabled = true;
            }
            else
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup success";
                lblPopUpIcon.CssClass = "popup-icon link-success";
                lblListAdded.Text = "Updated List " + listName + " with Selected Images";
                txtFileName.Text = "";
            }
        }

        #region Unused Methods
        //protected void btnShowSelectList_Click(object sender, EventArgs e)
        //{
        //    lblFileName.Visible = btnShowSelectList.Visible = txtFileName.Visible = false;
        //    lblSelectList.Visible = btnShowAddNewList.Visible = lstSelectList.Visible = btnDeleteList.Visible = true;
        //    btnAddUpdateList.Text = "Update";
        //    lblListAdded.Text = "";
        //    lblPopUpIcon.CssClass = "";
        //    pnlPopUp.Visible = false;

        //}

        //public void rptImages_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "Delete")
        //    {
        //            var ic = new ImageController();
        //            ic.DeleteImage(Convert.ToInt32(e.CommandArgument), ModuleId);
        //            rptImageList.DataSource = ic.GetImages(ModuleId);
        //            rptImageList.DataBind();
        //    }
        //}

        //protected void rptImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        //    {
        //        var i = (Images)e.Item.DataItem;
        //        var lnkDelete = e.Item.FindControl("lnkDelete") as LinkButton;
        //        lnkDelete.CommandArgument = i.ImageId.ToString();
        //        ClientAPI.AddButtonConfirm(lnkDelete, Localization.GetString("ConfirmDelete", LocalResourceFile));
        //    }
        //}

        #endregion
    }
}