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
                    if (ImageId > 0)
                    {
                        var ic = new ImageController();
                        var i = ic.GetImage(ImageId, ModuleId);
                        if (i != null)
                        {
                            i.ImageUrl = txtImageUrl.Text = i.ImageUrl;
                            txtTitle.Text = i.ImageTitle;
                            txtDescription.Text = i.ImageDescription;
                            txtPhotographer.Text = i.ImagePhotographer;
                            txtContact.Text = i.ImageContact;
                        }
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var i = new Images();
            var ic = new ImageController();
            if (ImageId > 0)
            {
                i = ic.GetImage(ImageId, ModuleId);
                i.ImageUrl = txtImageUrl.Text.Trim();
                i.ImageTitle = txtTitle.Text.Trim();
                i.ImageDescription = txtDescription.Text.Trim();
                i.ImagePhotographer = txtPhotographer.Text.Trim();
                i.ImageContact = txtContact.Text.Trim();
            }
            else
            {
                i = new Images()
                {
                    ImageUrl = txtImageUrl.Text.Trim(),
                    ImageTitle = txtTitle.Text.Trim(),
                    ImageDescription = txtDescription.Text.Trim(),
                    ImagePhotographer = txtPhotographer.Text.Trim(),
                    ImageContact = txtContact.Text.Trim(),
                    IsSelected = false
                };
            }
            i.ModuleId = ModuleId;
            if (i.ImageId > 0)
            {
                ic.UpdateImage(i);
            }
            else
            {
                ic.AddImage(i);
            }
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnImageUpload_Click(object sender, EventArgs e)
        {
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Images/"));
            btnImageSelect.SaveAs(Server.MapPath("~/DesktopModules/JSImageRotator/Images/" + btnImageSelect.FileName));

            if (btnImageSelect.FileName != null)
            {
                txtImageUrl.Text = "~/DesktopModules/JSImageRotator/Images/" + btnImageSelect.FileName;
            }
        }
    }
}