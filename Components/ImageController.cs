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
using System.Collections.Generic;
using DotNetNuke.Data;

namespace JS.Modules.JSImageRotator.Components
{
    class ImageController
    {
        public void AddImage(Images i)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Images>();
                rep.Insert(i);
            }
        }

        public void DeleteImage(int imageId, int moduleId)
        {
            var i = GetImage(imageId, moduleId);
            DeleteImage(i);
        }

        public void DeleteImage(Images i)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Images>();
                rep.Delete(i);
            }
        }

        public IEnumerable<Images> GetImages(int moduleId)
        {
            IEnumerable<Images> i;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Images>();
                i = rep.Get(moduleId);
            }
            return i;
        }

        public Images GetImage(int imageId, int moduleId)
        {
            Images i;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Images>();
                i = rep.GetById(imageId, moduleId);
            }
            return i;
        }

        public void UpdateImage(Images i)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Images>();
                rep.Update(i);
            }
        }

    }
}
