using DotNetNuke.ComponentModel.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;

namespace JS.Modules.JSImageRotator.Components
{
    [TableName("JSImageRotator_Settings")]
    //setup the primary key for table
    [PrimaryKey("SettingsId", AutoIncrement = false)]
    //configure caching using PetaPoco
    [Cacheable("CustomSettings", CacheItemPriority.Default, 20)]
    //scope the objects to the ModuleId of a module on a page (or copy of a module on a page)
    [Scope("ModuleId")]
    class CustomSettings
    {
        public int SettingsId { get; set; }
        public string RotatorType { get; set; }
        public int MinHeight { get; set; }
        public bool PlayPauseControl { get; set; }
        public bool SlideInfo { get; set; }
        public int Slide { get; set; }
        public bool Preload { get; set; }
        public bool PreloadImage { get; set; }
        public bool PreloadVideo { get; set; }
        public bool Timer { get; set; }
        public string Overlay { get; set; }
        public string OverlayType { get; set; }
        public bool Autoplay { get; set; }
        public bool Shuffle { get; set; }
        public int Delay { get; set; }
        public string Cover { get; set; }
        public string BackgroundColor { get; set; }
        public string Align { get; set; }
        public int AlignPercent { get; set; }
        public int VerticalAlignPercent { get; set; }
        public string Transition { get; set; }
        public string AutoTransitionDuration { get; set; }
        public int TransitionDuration  { get; set; }
        public string TransitionRegister { get; set; }
        public string Animation { get; set; }
        public string AutoAnimationDuration { get; set; }
        public int AnimationDuration { get; set; }
        public string AnimationRegister { get; set; }
    }
}