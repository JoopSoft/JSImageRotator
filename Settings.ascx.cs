/*
' Copyright (c) 2016  JoopSoft.com
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
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using JS.Modules.JSImageRotator.Components;
using System.Web.UI.WebControls;
using System.IO;

namespace JS.Modules.JSImageRotator
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Settings class manages Module Settings
    /// 
    /// Typically your settings control would be used to manage settings for your module.
    /// There are two types of settings, ModuleSettings, and TabModuleSettings.
    /// 
    /// ModuleSettings apply to all "copies" of a module on a site, no matter which page the module is on. 
    /// 
    /// TabModuleSettings apply only to the current module on the current page, if you copy that module to
    /// another page the settings are not transferred.
    /// 
    /// If you happen to save both TabModuleSettings and ModuleSettings, TabModuleSettings overrides ModuleSettings.
    /// 
    /// Below we have some examples of how to access these settings but you will need to uncomment to use.
    /// 
    /// Because the control inherits from JSImageRotatorSettingsBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Settings : JSImageRotatorModuleSettingsBase
    {
        #region Base Method Implementations
        public override void LoadSettings()
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    joopSoft.NavigateUrl = "http://www.joopsoft.com/";
                    joopSoft.Text = "JoopSOFT.com";
                    joopSoft.ToolTip = "JoopSOFT.com";
                    joopSoft.CssClass = "link-dev";
                    joopSoft.Target = "_blank";
                    bool isSettingPresent = false;
                    var sc = new SettingsController();
                    var cs = sc.LoadSettings();
                    foreach (CustomSettings s in cs)
                    {
                        if (s.SettingsId == ModuleId)
                        {
                            isSettingPresent = true;
                        }
                    }
                    if (isSettingPresent)
                    {
                        SettingsLoad(ModuleId);
                    }
                    else
                    {
                        SettingsLoad(0);
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        public override void UpdateSettings()
        {
            try
            {
                bool isSettingsPresent = false;
                var sc = new SettingsController();
                var cs = sc.LoadSettings();
                foreach (CustomSettings s in cs)
                {
                    if (s.SettingsId == ModuleId)
                    {
                        isSettingsPresent = true;
                        break;
                    }
                }
                if (!isSettingsPresent)
                {
                    var ns = new CustomSettings();
                    SettingsSave(ns);
                }
                else
                {
                    var s = sc.LoadSingleSettings(ModuleId);
                    SettingsSave(s);
                }
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        #endregion
        #region Help Methods
        void AddLine(string appendText)
        {
            string fileName = (Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Settings.json"));
            File.AppendAllText(fileName, appendText + Environment.NewLine);
        }

        string TransitionValues()
        {
            string temp;
            string transitionValues = "[ ";

            foreach (ListItem li in lbTransition.Items)
            {
                if (li.Selected)
                {
                    transitionValues += "\"" + li.Value + "\"" + ", ";
                }
            }
            temp = transitionValues + "]";
            transitionValues = temp.Replace(", ]", " ]");
            return transitionValues;
        }

        string AnimationValues()
        {
            string temp;
            string animationValues = "[ ";
            foreach (ListItem li in lbAnimation.Items)
            {
                if (li.Selected)
                {
                    animationValues += "\"" + li.Value + "\"" + ", ";
                }
            }
            temp = animationValues + "]";
            animationValues = temp.Replace(", ]", " ]");
            return animationValues;
        }

        int AlignPercent()
        {
            int temp = Convert.ToInt32(txtAlignPercentage.Text);
            if (temp < 0)
            {
                return 0;
            }
            else if (temp > 100)
            {
                return 100;
            }
            else
            {
                return temp;
            }
        }

        int VAlignPercent()
        {
            int temp = Convert.ToInt32(txtVAlignPercentage.Text);
            if (temp < 0)
            {
                return 0;
            }
            else if (temp > 100)
            {
                return 100;
            }
            else
            {
                return temp;
            }
        }

        void SettingsJson (CustomSettings s)
        {
            string fileName = (Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Settings.json"));
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
            using (FileStream fs = File.Open(fileName, FileMode.CreateNew)) { }
            AddLine("{");
            AddLine("\t\"settings\": {");
            AddLine("\t\t\"rotatorType\": " + "\"" + s.RotatorType.ToLower() + "\",");
            if (s.RotatorType == "container")
            {
                AddLine("\t\t\"minHeight\": " + s.MinHeight + ",");
            }
            AddLine("\t\t\"ppControl\": " + s.PlayPauseControl.ToString().ToLower() + ",");
            AddLine("\t\t\"slideInfo\": " + s.SlideInfo.ToString().ToLower() + ",");
            AddLine("\t\t\"slide\": " + s.Slide + ",");
            AddLine("\t\t\"preload\": " + s.Preload.ToString().ToLower() + ",");
            AddLine("\t\t\"preloadImage\": " + s.PreloadImage.ToString().ToLower() + ",");
            AddLine("\t\t\"preloadVideo\": " + s.PreloadVideo.ToString().ToLower() + ",");
            AddLine("\t\t\"timer\": " + s.Timer.ToString().ToLower() + ",");
            if (s.Overlay != "path")
            {
                AddLine("\t\t\"overlay\": " + s.Overlay.ToString().ToLower() + ",");
            }
            else
            {
                AddLine("\t\t\"overlay\": " + "\"" + ControlPath + "Vegas/overlays/" + s.OverlayType.ToString().ToLower() + "\",");
            }
            AddLine("\t\t\"autoplay\": " + s.Autoplay.ToString().ToLower() + ",");
            AddLine("\t\t\"shuffle\": " + s.Shuffle.ToString().ToLower() + ",");
            AddLine("\t\t\"delay\": " + s.Delay + ",");
            if (ddCover.SelectedValue == "repeat")
            {
                AddLine("\t\t\"cover\": \"" + s.Cover.ToLower() + "\",");
            }
            else
            {
                AddLine("\t\t\"cover\": " + s.Cover.ToLower() + ",");
            }
            AddLine("\t\t\"backgroundColor\": " + "\"" + s.BackgroundColor + "\",");
            switch (ddAlign.SelectedValue)
            {
                case "top-left":
                    AddLine("\t\t\"align\": \"left\",");
                    AddLine("\t\t\"valign\": \"top\",");
                    break;
                case "top-right":
                    AddLine("\t\t\"align\": \"right\",");
                    AddLine("\t\t\"valign\": \"top\",");
                    break;
                case "top-center":
                    AddLine("\t\t\"align\": \"center\",");
                    AddLine("\t\t\"valign\": \"top\",");
                    break;
                case "bottom-left":
                    AddLine("\t\t\"align\": \"left\",");
                    AddLine("\t\t\"valign\": \"bottom\",");
                    break;
                case "bottom-right":
                    AddLine("\t\t\"align\": \"right\",");
                    AddLine("\t\t\"valign\": \"bottom\",");
                    break;
                case "bottom-center":
                    AddLine("\t\t\"align\": \"center\",");
                    AddLine("\t\t\"valign\": \"bottom\",");
                    break;
                case "center-left":
                    AddLine("\t\t\"align\": \"left\",");
                    AddLine("\t\t\"valign\": \"center\",");
                    break;
                case "center-right":
                    AddLine("\t\t\"align\": \"right\",");
                    AddLine("\t\t\"valign\": \"center\",");
                    break;
                case "center-center":
                    AddLine("\t\t\"align\": \"center\",");
                    AddLine("\t\t\"valign\": \"center\",");
                    break;
                case "percentage":
                    AddLine("\t\t\"align\": " + s.AlignPercent + ",");
                    AddLine("\t\t\"valign\": " + s.VerticalAlignPercent + ",");
                    break;
                default:
                    break;
            }
            if (s.Transition != "[ ]")
            {
                AddLine("\t\t\"transition\": " + s.Transition + ",");
            }
            else
            {
                AddLine("\t\t\"transition\": \"fade\",");
            }
            if (rblTransDurationType.SelectedValue == "auto")
            {
                AddLine("\t\t\"transitionDuration\": " + "\"auto\",");
            }
            else
            {
                AddLine("\t\t\"transitionDuration\": " + s.TransitionDuration + ",");
            }
            AddLine("\t\t\"transitionRegister\": " + "\"" + s.TransitionRegister + "\",");
            if (s.Animation != "[ ]")
            {
            AddLine("\t\t\"animation\": " + s.Animation + ",");
            }
            else
            {
                AddLine("\t\t\"animation\": null," );
            }
            if (rblAnimDurationType.SelectedValue == "auto")
            {
                AddLine("\t\t\"animationDuration\": " + "\"auto\",");
            }
            else
            {
                AddLine("\t\t\"animationDuration\": " + s.AnimationDuration + ",");
            }
            AddLine("\t\t\"animationRegister\": " + "\"" + s.AnimationRegister + "\"");
            AddLine("\t}");
            AddLine("}");
        }

        void SettingsLoad(int id)
        {
            var sCon = new SettingsController();
            var s = sCon.LoadSingleSettings(id);
            ddRotatorType.SelectedValue = s.RotatorType;
            txtMinHeight.Text = s.MinHeight.ToString();
            cbPPControl.Checked = s.PlayPauseControl;
            cbSlideInfo.Checked = s.SlideInfo;
            txtSlide.Text = s.Slide.ToString();
            cbPreload.Checked = s.Preload;
            cbPreloadImage.Checked = s.PreloadImage;
            cbPreloadVideo.Checked = s.PreloadVideo;
            cbTimer.Checked = s.Timer;
            ddOverlay.SelectedValue = s.Overlay;
            ddOverlayType.SelectedValue = s.OverlayType;
            cbAutoplay.Checked = s.Autoplay;
            cbShuffle.Checked = s.Shuffle;
            txtDelay.Text = s.Delay.ToString();
            ddCover.SelectedValue = s.Cover;
            txtColor.Text = s.BackgroundColor;
            ddAlign.SelectedValue = s.Align;
            txtAlignPercentage.Text = s.AlignPercent.ToString();
            txtVAlignPercentage.Text = s.VerticalAlignPercent.ToString();
            foreach (ListItem li in lbTransition.Items)
            {
                if (s.Transition.Contains("\"" + li.Value + "\""))
                {
                    li.Selected = true;
                }
            }
            rblTransDurationType.SelectedValue = s.AutoTransitionDuration;
            txtTransDuration.Text = s.TransitionDuration.ToString();
            foreach (ListItem li in lbAnimation.Items)
            {
                if (s.Animation.Contains("\"" + li.Value + "\""))
                {
                    li.Selected = true;
                }
            }
            rblAnimDurationType.SelectedValue = s.AutoAnimationDuration;
            txtAnimDuration.Text = s.AnimationDuration.ToString();
        }

        void SettingsSave(CustomSettings s)
        {
            var sc = new SettingsController();
            s.RotatorType = ddRotatorType.SelectedValue;
            s.MinHeight = Convert.ToInt32(txtMinHeight.Text.Trim());
            s.PlayPauseControl = cbPPControl.Checked;
            s.SlideInfo = cbSlideInfo.Checked;
            s.Slide = Convert.ToInt32(txtSlide.Text.Trim());
            s.Preload = cbPreload.Checked;
            s.PreloadImage = cbPreloadImage.Checked;
            s.PreloadVideo = cbPreloadVideo.Checked;
            s.Timer = cbTimer.Checked;
            s.Overlay = ddOverlay.SelectedValue;
            s.OverlayType = ddOverlayType.SelectedValue;
            s.Autoplay = cbAutoplay.Checked;
            s.Shuffle = cbShuffle.Checked;
            s.Delay = Convert.ToInt32(txtDelay.Text.Trim());
            s.Cover = ddCover.SelectedValue;
            s.BackgroundColor = txtColor.Text.Trim();
            s.Align = ddAlign.SelectedValue;
            s.AlignPercent = AlignPercent();
            s.VerticalAlignPercent = VAlignPercent();
            s.Transition = TransitionValues();
            s.AutoTransitionDuration = rblTransDurationType.SelectedValue;
            s.TransitionDuration = Convert.ToInt32(txtTransDuration.Text.Trim());
            s.Animation = AnimationValues();
            s.AutoAnimationDuration = rblAnimDurationType.SelectedValue;
            s.AnimationDuration = Convert.ToInt32(txtAnimDuration.Text.Trim());
            SettingsJson(s);
            sc.UpdateSettings(s);
        }
        #endregion
    }
}