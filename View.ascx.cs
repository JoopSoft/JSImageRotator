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
using System.IO;
using DotNetNuke.Entities.Tabs;
using System.Web;

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
                lnkAdd.NavigateUrl = EditUrl("AddImage");
                lnkEdit.NavigateUrl = EditUrl();
                lnkView.NavigateUrl = EditUrl("Select");
                string PageName = TabController.CurrentPage.TabPath.Remove(0, 1);
                lnkSettings.NavigateUrl = "javascript:dnnModal.show('http://" + Request.Url.Host + PageName + "/ctl/Module/ModuleId/" + ModuleId + "?ReturnURL=" + PageName + "&amp;popUp=true#msSpecificSettings',/*showReturn*/false,550,950,true,'')";
                DefaultSettings();
                DefaultSlides();
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
                pnlControlHolder.Visible = btnPlayPause.Visible || pnlSlideInfo.Visible;
                if (IsEditable)
                {
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
                            lnkAdd.Visible = lnkEdit.Visible = lnkView.Visible = true;
                            pnlFirstButton.Visible = false;
                        }
                        else
                        {
                            lnkAdd.Visible = true;
                            lnkEdit.Visible = lnkView.Visible = false;
                            pnlFirstButton.Visible = true;
                            lnkFirstButton.Text = "Create Image List";
                            lnkFirstButton.ToolTip = "Create Image List";
                            lnkFirstButton.NavigateUrl = EditUrl();
                        }
                    }
                    else
                    {
                        lnkAdd.Visible = lnkEdit.Visible = lnkView.Visible = false;
                        pnlFirstButton.Visible = true;
                        lnkFirstButton.Text = "Add Image";
                        lnkFirstButton.ToolTip = "Add Image";
                        lnkFirstButton.NavigateUrl = EditUrl("AddImage");
                    }
                }
                else
                {
                    lnkAdd.Visible = lnkEdit.Visible = lnkView.Visible = false;
                    pnlFirstButton.Visible = false;
                    pnlAdmin.Visible = false;
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        void AddLine(string appendText, string fileName)
        {
            File.AppendAllText(fileName, appendText + Environment.NewLine);
        }

        protected void DefaultSettings()
        {
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
            string fileName = Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Settings.json");
            if (!File.Exists(fileName))
            {
                using (FileStream fs = File.Open(fileName, FileMode.CreateNew)) { }
                AddLine("{", fileName);
                AddLine("\t\"settings\": {", fileName);
                AddLine("\t\t\"rotatorType\": \"body\",", fileName);
                AddLine("\t\t\"minHeight\": 250,", fileName);
                AddLine("\t\t\"ppControl\": false,", fileName);
                AddLine("\t\t\"slideInfo\": false,", fileName);
                AddLine("\t\t\"slide\": 0,", fileName);
                AddLine("\t\t\"preload\": false,", fileName);
                AddLine("\t\t\"preloadImage\": false,", fileName);
                AddLine("\t\t\"preloadVideo\": false,", fileName);
                AddLine("\t\t\"timer\": true,", fileName);
                AddLine("\t\t\"overlay\": false,", fileName);
                AddLine("\t\t\"autoplay\": true,", fileName);
                AddLine("\t\t\"shuffle\": false,", fileName);
                AddLine("\t\t\"delay\": 5000,", fileName);
                AddLine("\t\t\"cover\": true,", fileName);
                AddLine("\t\t\"backgroundColor\": null,", fileName);
                AddLine("\t\t\"align\": \"center\",", fileName);
                AddLine("\t\t\"valign\": \"center\",", fileName);
                AddLine("\t\t\"transition\": \"fade\",", fileName);
                AddLine("\t\t\"transitionDuration\": 1000,", fileName);
                AddLine("\t\t\"transitionRegister\": [],", fileName);
                AddLine("\t\t\"animation\": null,", fileName);
                AddLine("\t\t\"animationDuration\": \"auto\",", fileName);
                AddLine("\t\t\"animationRegister\": []", fileName);
                AddLine("\t}", fileName);
                AddLine("}", fileName);
            }
        }

        protected void DefaultSlides()
        {
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
            string fileName = Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Slides.json");
            if (!File.Exists(fileName))
            //{
            //}
            //else
            {
                using (FileStream fs = File.Open(fileName, FileMode.CreateNew)) { }
                AddLine("{", fileName);
                AddLine("\t\"slides\": ", fileName);
                AddLine("\t[", fileName);
                AddLine("\t{", fileName);
                AddLine("\t\t\"src\": \"\",", fileName);
                AddLine("\t\t\"transition\": \"\",", fileName);
                AddLine("\t\t\"animation\": \"\",", fileName);
                AddLine("\t\t\"title\": \"\",", fileName);
                AddLine("\t\t\"photographer\": \"\",", fileName);
                AddLine("\t\t\"contact\": \"\"", fileName);
                AddLine("\t}", fileName);
                AddLine("\t]", fileName);
                AddLine("}", fileName);
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