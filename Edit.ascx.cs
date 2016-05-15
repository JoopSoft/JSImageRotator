﻿/*
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
using System.Text.RegularExpressions;

namespace JS.Modules.JSImageRotator
{
    public partial class Edit : JSImageRotatorModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Implement your edit logic for your module
                if (!Page.IsPostBack)
                {
                    joopSoft.NavigateUrl = "http://www.joopsoft.com/";
                    joopSoft.Text = "JoopSOFT.com";
                    joopSoft.ToolTip = "JoopSOFT.com";
                    joopSoft.CssClass = "link-dev";
                    joopSoft.Target = "_blank";
                    lnkAdd.NavigateUrl = EditUrl("AddImage");
                    lnkLists.NavigateUrl = EditUrl("Select");
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
                    if (listPresent)
                    {
                        SwitchToUpdate();
                    }
                    else
                    {
                        btnShowAddNewList.Enabled = lnkLists.Enabled = false;
                    }

                    var i = ic.GetImages(ModuleId);
                    rptImageList.DataSource = ic.GetImages(ModuleId);
                    rptImageList.DataBind();
                    ShowHideMenuControls();
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

        protected void btnAddUpdateList_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
            AddUpdateList();
            ShowHideMenuControls();
        }

        protected void btnShowAddNewList_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
            if (btnAddUpdateList.Text == "Create")
            {
                SwitchToUpdate();
            }
            else
            {
                SwitchToCreate();
            }
        }

        protected void lstSelectList_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
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
            pnlPopUp.Visible = false;
            pnlConfirmDelete.Visible = true;
            pnlConfirmDelete.CssClass = "DeleteList dnnFormItem popup confirm-box warning";
            lblConfirmIcon.CssClass = "popup-icon link-delete no-txt";
            lblConfirmDelete.Text = "Are you sure you want to Delete this List!";
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
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
                    btnShowAddNewList.Enabled = lnkLists.Enabled = false;
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
                bool notEmptyList = false;
                bool imagePresent = false;
                ic.DeleteImage(Convert.ToInt32(lblDeleteImageID.Text), ModuleId);
                File.Delete(Server.MapPath(lblDeleteImageUrl.Text));
                rptImageList.DataSource = ic.GetImages(ModuleId);
                rptImageList.DataBind();
                pnlConfirmDelete.Visible = false;
                pnlConfirmDelete.CssClass = "";
                lblConfirmIcon.CssClass = "";
                var ai = ic.GetImages(ModuleId);
                var al = ic.GetLists(ModuleId);
                foreach (var lst in al)
                {
                    foreach (var img in ai)
                    {
                        if (img.ListsIn.Contains(lst.ListName))
                        {
                            notEmptyList = true;
                        }
                    }
                    if (!notEmptyList)
                    {
                        ic.DeleteList(lst.ImageListId, ModuleId);
                    }
                    notEmptyList = false;
                }
                foreach (var img in ai)
                {
                    imagePresent = true;
                }
                if (!imagePresent)
                {
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
                }
            }
            ShowHideMenuControls();
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
            pnlConfirmDelete.Visible = false;
            pnlConfirmDelete.CssClass = "";
            lblConfirmIcon.CssClass = "";


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
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
                var ddAnimation = ri.FindControl("ddAnimation") as DropDownList;
                var ddTransition = ri.FindControl("ddTransition") as DropDownList;
                if (sender.Equals(btnEdit))
                {
                    if (!imgTitle.Enabled)
                    {
                        imgTitle.Enabled = imgDescription.Enabled = imgPhotographer.Enabled = imgContact.Enabled = ddAnimation.Enabled = ddTransition.Enabled = true;
                        tableRow.CssClass = "table-row active";
                        lnkDelete.CssClass = "btn btn-primary link-cancel no-txt";
                        lnkDelete.ToolTip = "Cancel";
                        btnEdit.ToolTip = "Save";
                        btnEdit.CssClass = "btn btn-primary link-save no-txt";
                        pnlOverlay.Visible = true;
                        pnlOverlay.CssClass = "dnnFormItem popup overlay";
                        lblOverlayIcon.CssClass = "popup-icon link-edit-square no-txt";
                        lblOverlayMsg.Text = "Edit selected slide";
                    }
                    else
                    {
                        var i = ic.GetImage(Convert.ToInt32(imgId.Text), ModuleId);
                        i.ImageTitle = imgTitle.Text.Trim();
                        i.ImageDescription = imgDescription.Text.Trim();
                        i.ImagePhotographer = imgPhotographer.Text.Trim();
                        i.ImageContact = imgContact.Text.Trim();
                        i.Animation = ddAnimation.SelectedValue;
                        i.Transition = ddTransition.SelectedValue;
                        ic.UpdateImage(i);
                        imgTitle.Enabled = imgDescription.Enabled = imgPhotographer.Enabled = imgContact.Enabled = ddAnimation.Enabled = ddTransition.Enabled = false;
                        tableRow.CssClass = "table-row";
                        lnkDelete.CssClass = "btn btn-danger link-delete no-txt";
                        lnkDelete.ToolTip = "Delete";
                        btnEdit.ToolTip = "Edit";
                        btnEdit.CssClass = "btn btn-primary link-edit no-txt";
                        pnlOverlay.Visible = false;
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
            pnlPopUp.Visible = false;
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
                var ddAnimation = ri.FindControl("ddAnimation") as DropDownList;
                var ddTransition = ri.FindControl("ddTransition") as DropDownList;
                if (sender.Equals(lnkDelete))
                {
                    if (!imgTitle.Enabled)
                    {
                        pnlConfirmDelete.Visible = true;
                        pnlConfirmDelete.CssClass = "DeleteImage dnnFormItem popup confirm-box warning";
                        lblConfirmIcon.CssClass = "popup-icon link-delete no-txt";
                        lblConfirmDelete.Text = "Are you sure you want to Delete this Image!";
                        lblDeleteImageID.Text = imgId.Text;
                        lblDeleteImageUrl.Text = imgPreview.ImageUrl;
                    }
                    else
                    {
                        imgTitle.Enabled = imgDescription.Enabled = imgPhotographer.Enabled = imgContact.Enabled = ddAnimation.Enabled = ddTransition.Enabled = false;
                        tableRow.CssClass = "";
                        lnkDelete.CssClass = "btn btn-danger link-delete";
                        lnkDelete.ToolTip = "Delete";
                        btnEdit.ToolTip = "Edit";
                        btnEdit.CssClass = "btn btn-primary link-edit";
                        pnlOverlay.Visible = false;
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
                    li.title = img.ImageTitle;
                    li.description = img.ImageDescription;
                    li.photographer = img.ImagePhotographer;
                    li.contact = img.ImageContact;
                    string src = img.ImageUrl.Remove(0, 1);
                    li.src = src;
                    li.animation = img.Animation;
                    li.transition = img.Transition;
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
            string tempString, resultString;
            using (StreamReader sreader = new StreamReader(path))
            {
                tempString = sreader.ReadToEnd();
            }
            resultString = tempString.Replace("\"transition\": \"default\",", String.Empty);
            tempString = resultString.Replace("\"animation\": \"default\",", String.Empty);
            resultString = Regex.Replace(tempString, @"^\s+$[\r\n]*", "", RegexOptions.Multiline);
            File.Delete(path);

            using (StreamWriter swriter = new StreamWriter(path, false))
            {
                resultString = "\"slides\":" + Environment.NewLine + resultString;
                resultString = "{" + Environment.NewLine + resultString;
                swriter.Write(resultString);
            }
            string appendText = Environment.NewLine + "}";
            File.AppendAllText(Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Slides.json"), appendText);
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
                pnlPopUp.CssClass = "dnnFormItem popup auto-close-box warning";
                lblPopUpIcon.CssClass = "popup-icon link-warning no-txt";
                lblListAdded.Text = "No image selected and filename field is empty";
            }
            else if (!selectedImagePresent && listName != "")
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup auto-close-box warning";
                lblPopUpIcon.CssClass = "popup-icon link-warning no-txt";
                lblListAdded.Text = "No Image Selected";
            }
            else if (selectedImagePresent && listName == "")
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup auto-close-box warning";
                lblPopUpIcon.CssClass = "popup-icon link-warning no-txt";
                lblListAdded.Text = "Filename field is empty";
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
                pnlPopUp.CssClass = "dnnFormItem popup auto-close-box success";
                lblPopUpIcon.CssClass = "popup-icon link-success no-txt";
                lblListAdded.Text = "\"" + listName + "\" was created with selected images";
                txtFileName.Text = "";
                lstSelectList.Items.Add(listName);
                btnShowAddNewList.Enabled = lnkLists.Enabled = true;
                SwitchToUpdate();
            }
            else
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "dnnFormItem popup auto-close-box success";
                lblPopUpIcon.CssClass = "popup-icon link-success no-txt";
                lblListAdded.Text = "\"" + listName + "\" was updated with selected images";
                txtFileName.Text = "";
            }
        }

        protected void ShowHideMenuControls()
        {
            bool listPresent = false;
            var ic = new ImageController();
            var al = ic.GetLists(ModuleId);
            var ai = ic.GetImages(ModuleId);
            foreach (var lst in al)
            {
                if (lst.ImageListId != 0)
                {
                    listPresent = true;
                    break;
                }
            }
            if (listPresent)
            {
                btnShowAddNewList.Visible = lnkLists.Visible = true;
                headerMenu.CssClass = "dnnFormMessage three-controls dnnFormTitle no-spacing";
            }
            else
            {
                btnShowAddNewList.Visible = lnkLists.Visible = false;
                headerMenu.CssClass = "dnnFormMessage one-control dnnFormTitle no-spacing";
            }
        }

        protected void SwitchToUpdate()
        {
            lblFileName.Visible = txtFileName.Visible = false;
            lblSelectList.Visible = lstSelectList.Visible = btnDeleteList.Visible = true;
            btnAddUpdateList.Text = "Update";
            btnAddUpdateList.CssClass = "btnAddUpdateList btn btn-primary link-save";
            btnAddUpdateList.ToolTip = "Update List";
            lblListAdded.Text = "";
            lblPopUpIcon.CssClass = "";
            pnlPopUp.Visible = false;
            btnShowAddNewList.ToolTip = "Create New List";
            lblJsonTitle.Text = "Update Image Lists";
            btnSubmit.Text = "Update And Apply";
            btnSubmit.ToolTip = "Update And Apply";
        }

        protected void SwitchToCreate()
        {
            lblFileName.Visible = txtFileName.Visible = true;
            lblSelectList.Visible = lstSelectList.Visible = btnDeleteList.Visible = false;
            btnAddUpdateList.Text = "Create";
            btnAddUpdateList.CssClass = "btnAddUpdateList btn btn-primary link-add";
            btnAddUpdateList.ToolTip = "Create New List";
            lblListAdded.Text = "";
            lblPopUpIcon.CssClass = "";
            pnlPopUp.Visible = false;
            pnlPopUp.CssClass = "";
            btnShowAddNewList.ToolTip = "Edit Available Lists";
            lblJsonTitle.Text = "Create Image Lists";
            btnSubmit.Text = "Create And Apply";
            btnSubmit.ToolTip = "Create And Apply";
        }
    }
}