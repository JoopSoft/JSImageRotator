/*
' Copyright (c) 2016 JoopSoft
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
using System.Web.Caching;
using DotNetNuke.Common.Utilities;
using DotNetNuke.ComponentModel.DataAnnotations;
using DotNetNuke.Entities.Content;
using System.Collections.Generic;

namespace JS.Modules.JSImageRotator.Components
{
    [TableName("JSImageRotator_Images")]
    //setup the primary key for table
    [PrimaryKey("ImageId", AutoIncrement = true)]
    //configure caching using PetaPoco
    [Cacheable("Images", CacheItemPriority.Default, 20)]
    //scope the objects to the ModuleId of a module on a page (or copy of a module on a page)
    [Scope("ModuleId")]
    class Images
    {
        public int ImageId { get; set; }
        public string ImageTitle { get; set; }
        public string ImageDescription { get; set; }
        public string ImagePhotographer { get; set; }
        public string ImageContact { get; set; }
        public string ImageUrl { get; set; }
        public string ListsIn { get; set; }
        public bool IsSelected { get; set; }
        public bool DefaultSettings { get; set; }
        public string Transition { get; set; }
        public string Animation { get; set; }
        public int ModuleId { get; set; }
    }
}
