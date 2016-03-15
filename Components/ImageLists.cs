using DotNetNuke.ComponentModel.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;

namespace JS.Modules.JSImageRotator.Components
{
    [TableName("JSImageRotator_ImageLists")]
    //setup the primary key for table
    [PrimaryKey("ImageListId", AutoIncrement = true)]
    //configure caching using PetaPoco
    [Cacheable("ImageLists", CacheItemPriority.Default, 20)]
    //scope the objects to the ModuleId of a module on a page (or copy of a module on a page)
    [Scope("ModuleId")]
    class ImageLists
    {
        public int ImageListId { get; set; }
        public string ListName { get; set; }
        public int ModuleId { get; set; }
    }
}