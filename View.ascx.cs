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
using System.Web.UI.WebControls;
using JS.Modules.JSImageRotator.Components;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Utilities;

namespace JS.Modules.JSImageRotator
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The View class displays the content
    /// 
    /// Typically your view control would be used to display content or functionality in your module.
    /// 
    /// View may be the only control you have in your project depending on the complexity of your module
    /// 
    /// Because the control inherits from JSImageRotatorModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : JSImageRotatorModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (IsEditable)
                {
                    var ic = new ImageController();
                    var ai = ic.GetImages(ModuleId);
                    var al = ic.GetLists(ModuleId);
                    var sc = new SettingsController();
                    var als = sc.LoadSettings();
                    var s = new CustomSettings();
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
                    btnPlayPause.Visible = s.PlayPauseControl;
                    pnlSlideInfo.Visible = s.SlideInfo;
                    //btnSlideInfo.Visible = pnlSlideInfo.Visible = s.SlideInfo;
                    pnlControlHolder.Visible = btnPlayPause.Visible || pnlSlideInfo.Visible;
                    pnlAdmin.Visible = true;
                    bool imagePresent = false;
                    bool listPresent = false;
                    foreach (var img in ai)
                    {
                        imagePresent = true;
                    }
                    foreach (var lst in al)
                    {
                        listPresent = true;
                    }
                    if (imagePresent)
                    {
                        if (listPresent)
                        {
                            pnlFirstButton.Visible = false;
                        }
                        else
                        {
                            pnlFirstButton.Visible = true;
                            lnkFirstButton.Text = "Create Image List";
                            lnkFirstButton.ToolTip = "Create Image List";
                            lnkFirstButton.NavigateUrl = EditUrl();
                        }
                    }
                    else
                    {
                        pnlFirstButton.Visible = true;
                        lnkFirstButton.Text = "Add Image";
                        lnkFirstButton.ToolTip = "Add Image";
                        lnkFirstButton.NavigateUrl = EditUrl("AddImage");
                    }
                }
                else
                {
                    pnlFirstButton.Visible = false;
                    pnlAdmin.Visible = false;
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        public ModuleActionCollection ModuleActions
        {
            get
            {
                var ic = new ImageController();
                var ai = ic.GetImages(ModuleId);
                var al = ic.GetLists(ModuleId);
                bool imagePresent = false;
                bool listPresent = false;
                foreach (var img in ai)
                {
                    imagePresent = true;
                }
                foreach (var lst in al)
                {
                    listPresent = true;
                }
                var actions = new ModuleActionCollection
                {
                    {
                        GetNextActionID(), Localization.GetString("AddImage", LocalResourceFile), "", "", "",
                        EditUrl("AddImage"), false, SecurityAccessLevel.Edit, true, false
                    }
                };
                if (imagePresent)
                {
                    if (listPresent)
                    {
                        actions = new ModuleActionCollection
                    {
                        {
                            GetNextActionID(), Localization.GetString("AddImage", LocalResourceFile), "", "", "",
                            EditUrl("AddImage"), false, SecurityAccessLevel.Edit, true, false
                        },
                        {
                            GetNextActionID(), Localization.GetString("EditModule", LocalResourceFile), "", "", "",
                            EditUrl(), false, SecurityAccessLevel.Edit, true, false
                        },
                        {
                            GetNextActionID(), Localization.GetString("Select", LocalResourceFile), "", "", "",
                            EditUrl("Select"), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                    }
                    else
                    {
                        actions = new ModuleActionCollection
                    {
                        {
                            GetNextActionID(), Localization.GetString("AddImage", LocalResourceFile), "", "", "",
                            EditUrl("AddImage"), false, SecurityAccessLevel.Edit, true, false
                        },
                        {
                            GetNextActionID(), Localization.GetString("EditModule", LocalResourceFile), "", "", "",
                            EditUrl(), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                    }
                }
                return actions;
            }
        }
    }
}