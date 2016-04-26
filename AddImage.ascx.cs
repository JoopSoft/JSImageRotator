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
using System.IO;

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
    public partial class AddImage : JSImageRotatorModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Implement your edit logic for your module
                if (!Page.IsPostBack)
                {
                    btnEdit.NavigateUrl = EditUrl();
                    btnLists.NavigateUrl = EditUrl("Select");
                    ShowHideMenuControls();
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnImageUpload_Click(object sender, EventArgs e)
        {
            if (btnImageSelect.HasFile)
            {
                DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Images/"));
                btnImageSelect.SaveAs(Server.MapPath("~/DesktopModules/JSImageRotator/Images/" + btnImageSelect.FileName));
                var ic = new ImageController();
                var al = ic.GetLists(ModuleId);
                bool listPresent = false;
                foreach (var l in al)
                {
                    if (l != null)
                    {
                        listPresent = true;
                        break;
                    }
                }
                if (btnImageSelect.FileName != null)
                {
                    txtImageUrl.Text = btnImageSelect.FileName;
                    pnlImgSelected.Visible = true;
                    imgPreview.ImageUrl = "~/DesktopModules/JSImageRotator/Images/" + btnImageSelect.FileName;
                    if (listPresent)
                    {
                        pnlAddToList.Visible = true;
                        cbAddToList.Checked = true;
                    }
                }
                //pnlMsgBox.Visible = true;
                lblAddedImage.Text = "<i class='fa fa-check'></i> Image Uploaded";
            }
            else
            {
                //pnlMsgBox.Visible = true;
                lblAddedImage.Text = "<i class='fa fa-check'></i> Please Select an Image to Upload";
            }
        }

        protected void btnAddImage_Click(object sender, EventArgs e)
        {
            var sc = new SettingsController();
            var als = sc.LoadSettings();
            var s = new CustomSettings();
            string animation;
            string transition;
            foreach (var stng in als)
            {
                if (stng.SettingsId == ModuleId)
                {
                    s = sc.LoadSingleSettings(ModuleId);
                    break;
                }
                else
                {
                    s = sc.LoadSingleSettings(0);
                }
            }
            if (cbGlobalFx.Checked)
            {
                transition = animation = "Default";
            }
            else
            {
                animation = ddAnimation.SelectedValue;
                transition = ddTransition.SelectedValue;
            }
            if (txtImageUrl.Text != "")
            {
                if (txtTitle.Text != "" && txtDescription.Text != "" && txtPhotographer.Text != "" && txtContact.Text != "")
                {
                    var i = new Images();
                    var ic = new ImageController();
                    string listToAdd = "";
                    if (cbAddToList.Checked)
                    {
                        listToAdd = ddAvailableLists.SelectedValue;
                    }
                    //if (ImageId > 0)
                    //{
                    //    i = ic.GetImage(ImageId, ModuleId);
                    //    i.ImageUrl = imgPreview.ImageUrl;
                    //    i.ImageTitle = txtTitle.Text.Trim();
                    //    i.ImageDescription = txtDescription.Text.Trim();
                    //    i.ImagePhotographer = txtPhotographer.Text.Trim();
                    //    i.ImageContact = txtContact.Text.Trim();
                    //    i.ListsIn = listToAdd + ".json, ";
                    //}
                    //else
                    //{
                    i = new Images()
                    {
                        ImageUrl = imgPreview.ImageUrl,
                        ImageTitle = txtTitle.Text.Trim(),
                        ImageDescription = txtDescription.Text.Trim(),
                        ImagePhotographer = txtPhotographer.Text.Trim(),
                        ImageContact = txtContact.Text.Trim(),
                        IsSelected = false,
                        DefaultSettings = cbGlobalFx.Checked,
                        Animation = animation,
                        Transition = transition,
                        ListsIn = listToAdd + ".json, "
                    };
                    //}
                    i.ModuleId = ModuleId;
                    if (i.ImageId > 0)
                    {
                        ic.UpdateImage(i);
                    }
                    else
                    {
                        ic.AddImage(i);
                    }
                    //pnlMsgBox.Visible = true;

                    lblAddedImage.Text = "<i class='fa fa-check'></i> Image Added";
                    txtImageUrl.Text = txtTitle.Text = txtDescription.Text = txtPhotographer.Text = txtContact.Text = "";
                    pnlImgSelected.Visible = pnlImgSelected.Visible = pnlAddToList.Visible = false;
                    cbAddToList.Checked = false;
                    ShowHideMenuControls();
                }
                else
                {
                    //pnlMsgBox.Visible = true;
                    lblAddedImage.Text = "<i class='fa fa-warning'></i> Please Fill All Fields";
                }
            }
            else
            {
                //pnlMsgBox.Visible = true;
                lblAddedImage.Text = "<i class='fa fa-warning'></i> Please Upload Image First";
            }
        }

        protected void btnDeleteImg_Click(object sender, EventArgs e)
        {
            //lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = true;
            pnlConfirmDelete.Visible = true;
            pnlConfirmDelete.CssClass = "dnnFormItem popup confirm-box warning";
            lblConfirmIcon.CssClass = "popup-icon link-delete";
            //pnlMsgBox.Visible = false;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            File.Delete(Server.MapPath("~/DesktopModules/JSImageRotator/Images/" + txtImageUrl.Text));
            //lblConfirmDelete.Visible = btnYes.Visible = btnNo.Visible = false;
            pnlConfirmDelete.Visible = false;
            pnlConfirmDelete.CssClass = "";
            lblConfirmIcon.CssClass = "";
            pnlImgSelected.Visible = pnlAddToList.Visible = false;
            cbAddToList.Checked = false;
            txtImageUrl.Text = "";
            //pnlMsgBox.Visible = true;
            lblAddedImage.Text = "<i class='fa fa-check'></i> Image Deleted";
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            pnlConfirmDelete.Visible = false;
            pnlConfirmDelete.CssClass = "";
            lblConfirmIcon.CssClass = "";
        }

        protected void cbAddToList_CheckedChanged(object sender, EventArgs e)
        {
            //pnlAddToList.Visible = cbAddToList.Checked;
            //ddAvailableLists.Visible = cbAddToList.Checked;

            var ic = new ImageController();
            var al = ic.GetLists(ModuleId);
            ddAvailableLists.Items.Clear();
            foreach (var l in al)
            {
                if (l != null)
                {
                    ddAvailableLists.Items.Add(l.ListName);
                }
            }
            //pnlMsgBox.Visible = false;
        }

        protected void ShowHideMenuControls()
        {
            bool listPresent = false;
            bool imagePresent = false;
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
            foreach (var img in ai)
            {
                if (img.ImageId != 0)
                {
                    imagePresent = true;
                    break;
                }
            }
            if (imagePresent)
            {
                if (listPresent)
                {
                    btnEdit.Visible = btnLists.Visible = true;
                    headerMenu.CssClass = "dnnFormMessage two-controls dnnFormTitle no-spacing";
                }
                else
                {
                    btnEdit.Visible = true;
                    btnLists.Visible = false;
                    headerMenu.CssClass = "dnnFormMessage one-control dnnFormTitle no-spacing";
                }
            }
            else
            {
                btnEdit.Visible = btnLists.Visible = false;
                headerMenu.CssClass = "dnnFormMessage no-controls dnnFormTitle no-spacing";
            }
        }
    }
}