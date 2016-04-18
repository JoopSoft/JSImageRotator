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

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// LoadSettings loads the settings from the Database and displays them
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void LoadSettings()
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    var sc = new SettingsController();
                    var cs = sc.LoadSettings();
                    foreach (CustomSettings s in cs)
                    {
                        if (s.SettingsId == ModuleId)
                        {
                            ddRotatorType.SelectedValue = s.RotatorType;
                            cbPPControl.Checked = s.PlayPauseControl;
                            cbSlideInfo.Checked = s.SlideInfo;
                            cbPreload.Checked = s.Preload;
                            cbPreloadImage.Checked = s.PreloadImage;
                            cbPreloadVideo.Checked = s.PreloadVideo;
                            cbTimer.Checked = s.Timer;
                            cbOverlay.Checked = s.Overlay;
                            ddOverlayType.SelectedValue = s.OverlayType;
                            cbAutoplay.Checked = s.Autoplay;
                            cbShuffle.Checked = s.Shuffle;
                            txtDelay.Text = s.Delay.ToString();
                            ddCover.SelectedValue = s.Cover;
                            txtColor.Text = s.BackgroundColor;
                            ddAlign.SelectedValue = s.Align;
                            ddVAlign.SelectedValue = s.VerticalAlign;
                            foreach (ListItem li in lbTransition.Items)
                            {
                                if (s.Transition.Contains("\"" + li.Value + "\""))
                                {
                                    li.Selected = true;
                                }
                            }
                            rblTransDurationType.SelectedValue = s.AutoTransitionDuration;
                            txtTransDuration.Text = s.TransitionDuration.ToString();
                            //txtTransRegister.Text = s.TransitionRegister; - 2nd verse of module
                            foreach (ListItem li in lbAnimation.Items)
                            {
                                if (s.Animation.Contains("\"" + li.Value + "\""))
                                {
                                    li.Selected = true;
                                }
                            }
                            rblAnimDurationType.SelectedValue = s.AutoAnimationDuration;
                            txtAnimDuration.Text = s.AnimationDuration.ToString();
                            //txtAnimRegister.Text = s.AnimationRegister; - 2nd verse of module
                        }
                        else
                        {
                            var ds = sc.LoadSingleSettings(0);
                            ddRotatorType.SelectedValue = ds.RotatorType;
                            cbPPControl.Checked = ds.PlayPauseControl;
                            cbSlideInfo.Checked = ds.SlideInfo;
                            cbPreload.Checked = ds.Preload;
                            cbPreloadImage.Checked = ds.PreloadImage;
                            cbPreloadVideo.Checked = ds.PreloadVideo;
                            cbTimer.Checked = ds.Timer;
                            cbOverlay.Checked = ds.Overlay;
                            ddOverlayType.SelectedValue = s.OverlayType;
                            cbAutoplay.Checked = ds.Autoplay;
                            cbShuffle.Checked = ds.Shuffle;
                            txtDelay.Text = ds.Delay.ToString();
                            ddCover.SelectedValue = ds.Cover;
                            txtColor.Text = ds.BackgroundColor;
                            ddAlign.SelectedValue = ds.Align;
                            ddVAlign.SelectedValue = ds.VerticalAlign;
                            foreach (ListItem li in lbTransition.Items)
                            {
                                if (s.Transition.Contains("\"" + li.Value + "\""))
                                {
                                    li.Selected = true;
                                }
                            }
                            rblTransDurationType.SelectedValue = ds.AutoTransitionDuration;
                            txtTransDuration.Text = ds.TransitionDuration.ToString();
                            //txtTransRegister.Text = ds.TransitionRegister; - 2nd verse of module
                            foreach (ListItem li in lbAnimation.Items)
                            {
                                if (s.Animation.Contains("\"" + li.Value + "\""))
                                {
                                    li.Selected = true;
                                }
                            }
                            rblAnimDurationType.SelectedValue = ds.AutoAnimationDuration;
                            txtAnimDuration.Text = ds.AnimationDuration.ToString();
                            //txtAnimRegister.Text = ds.AnimationRegister; - 2nd verse of module
                        }
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// UpdateSettings saves the modified settings to the Database
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void UpdateSettings()
        {
            try
            {
                bool isSettingsPresent = false;
                string temp;
                string transitionValues = "[ ";
                string animationValues = "[ ";
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
                    foreach (ListItem li in lbTransition.Items)
                    {
                        if (li.Selected)
                        {
                            transitionValues += "\"" + li.Value + "\"" + ", ";
                        }
                    }
                    temp = transitionValues + "]";
                    transitionValues = temp.Replace(", ]", " ]");
                    foreach (ListItem li in lbAnimation.Items)
                    {
                        if (li.Selected)
                        {
                            animationValues += "\"" + li.Value + "\"" + ", ";
                        }
                    }
                    temp = animationValues + "]";
                    animationValues = temp.Replace(", ]", " ]");
                    var ns = new CustomSettings()
                    {
                        SettingsId = ModuleId,
                        RotatorType = ddRotatorType.SelectedValue,
                        PlayPauseControl = cbPPControl.Checked,
                        SlideInfo = cbSlideInfo.Checked,
                        Preload = cbPreload.Checked,
                        PreloadImage = cbPreloadImage.Checked,
                        PreloadVideo = cbPreloadVideo.Checked,
                        Timer = cbTimer.Checked,
                        Overlay = cbOverlay.Checked,
                        OverlayType = ddOverlayType.SelectedValue,
                        Autoplay = cbAutoplay.Checked,
                        Shuffle = cbShuffle.Checked,
                        Delay = Convert.ToInt32(txtDelay.Text.Trim()),
                        Cover = ddCover.SelectedValue,
                        BackgroundColor = txtColor.Text.Trim(),
                        Align = ddAlign.SelectedValue,
                        VerticalAlign = ddVAlign.SelectedValue,
                        Transition = transitionValues,
                        AutoTransitionDuration = rblTransDurationType.SelectedValue,
                        TransitionDuration = Convert.ToInt32(txtTransDuration.Text.Trim()),
                        //TransitionRegister = txtTransRegister.Text.Trim(), - 2nd verse of module
                        Animation = animationValues,
                        AutoAnimationDuration = rblAnimDurationType.SelectedValue,
                        AnimationDuration = Convert.ToInt32(txtAnimDuration.Text.Trim()),
                        //AnimationRegister = txtAnimRegister.Text.Trim() - 2nd verse of module
                    };
                    sc.AddSettings(ns);
                }
                else
                {
                    var s = sc.LoadSingleSettings(ModuleId);
                    foreach (ListItem li in lbTransition.Items)
                    {
                        if (li.Selected)
                        {
                            transitionValues += "\"" + li.Value + "\"" + ", ";
                        }
                    }
                    temp = transitionValues + "]";
                    transitionValues = temp.Replace(", ]", " ]");
                    foreach (ListItem li in lbAnimation.Items)
                    {
                        if (li.Selected)
                        {
                            animationValues += "\"" + li.Value + "\"" + ", ";
                        }
                    }
                    temp = animationValues + "]";
                    animationValues = temp.Replace(", ]", " ]");
                    s.RotatorType = ddRotatorType.SelectedValue;
                    s.PlayPauseControl = cbPPControl.Checked;
                    s.SlideInfo = cbSlideInfo.Checked;
                    s.Preload = cbPreload.Checked;
                    s.PreloadImage = cbPreloadImage.Checked;
                    s.PreloadVideo = cbPreloadVideo.Checked;
                    s.Timer = cbTimer.Checked;
                    s.Overlay = cbOverlay.Checked;
                    s.OverlayType = ddOverlayType.SelectedValue;
                    s.Autoplay = cbAutoplay.Checked;
                    s.Shuffle = cbShuffle.Checked;
                    s.Delay = Convert.ToInt32(txtDelay.Text.Trim());
                    s.Cover = ddCover.SelectedValue;
                    s.BackgroundColor = txtColor.Text.Trim();
                    s.Align = ddAlign.SelectedValue;
                    s.VerticalAlign = ddVAlign.SelectedValue;
                    s.Transition = transitionValues;
                    s.AutoTransitionDuration = rblTransDurationType.SelectedValue;
                    s.TransitionDuration = Convert.ToInt32(txtTransDuration.Text.Trim());
                    //s.TransitionRegister = txtTransRegister.Text.Trim(); - 2nd verse of module
                    s.Animation = animationValues;
                    s.AutoAnimationDuration = rblAnimDurationType.SelectedValue;
                    s.AnimationDuration = Convert.ToInt32(txtAnimDuration.Text.Trim());
                    //s.AnimationRegister = txtAnimRegister.Text.Trim(); - 2nd verse of module
                    string fileName = (Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Settings.json"));
                    DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
                    if (File.Exists(fileName))
                    {
                        File.Delete(fileName);
                    }
                    using (FileStream fs = File.Open(fileName, FileMode.CreateNew)) { }
                    File.AppendAllText(fileName, "{");
                    AddLine("\"Settings\": [");
                    AddLine("\"rotatorType\": " + "\"" + s.RotatorType + "\"");
                    AddLine("\"ppControl\": " + "\"" + s.PlayPauseControl + "\"");
                    AddLine("\"slideInfo\": " + "\"" + s.SlideInfo + "\"");
                    AddLine("\"slide\": " + "\"0\"");
                    AddLine("\"preload\": " + "\"" + s.Preload + "\"");
                    AddLine("\"preloadImage\": " + "\"" + s.PreloadImage + "\"");
                    AddLine("\"preloadVideo\": " + "\"" + s.PreloadVideo + "\"");
                    AddLine("\"timer\": " + "\"" + s.Timer + "\"");
                    AddLine("\"overlay\": " + "\"" + s.Overlay + "\"");
                    AddLine("\"autoplay\": " + "\"" + s.Autoplay + "\"");
                    AddLine("\"shuffle\": " + "\"" + s.Shuffle + "\"");
                    AddLine("\"delay\": " + "\"" + s.Delay + "\"");
                    AddLine("\"cover\": " + "\"" + s.Cover + "\"");
                    AddLine("\"backgroundColor\": " + "\"" + s.BackgroundColor + "\"");
                    AddLine("\"align\": " + "\"" + s.Align + "\"");
                    AddLine("\"vAlign\": " + "\"" + s.VerticalAlign + "\"");
                    AddLine("\"transition\": " + "\"" + s.Transition + "\"");
                    AddLine("\"transitionDuration\": " + "\"" + s.TransitionDuration + "\"");
                    AddLine("\"transitionRegister\": " + "\"" + s.TransitionRegister + "\"");
                    AddLine("\"animation\": " + "\"" + s.Animation + "\"");
                    AddLine("\"animationDuration\": " + "\"" + s.AnimationDuration + "\"");
                    AddLine("\"animationRegister\": " + "\"" + s.AnimationRegister + "\"");
                    AddLine("]");
                    AddLine("{");
                    sc.UpdateSettings(s);
                }
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        public void Generate()
        {
            var sc = new SettingsController();
            var s = sc.LoadSingleSettings(ModuleId);
            string fileName = (Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Settings.json"));
            DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/DesktopModules/JSImageRotator/Json/"));
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
            using (FileStream fs = File.Open(fileName, FileMode.CreateNew)) { }
            AddLine("\"rotatorType\": " + "\"" + s.RotatorType + "\"");
        }
        public void AddLine(string appendText)
        {
            string fileName = (Server.MapPath("~/DesktopModules/JSImageRotator/Json/" + ModuleId + "_Settings.json"));
            File.AppendAllText(fileName, Environment.NewLine + appendText);
        }
        #endregion
    }
}