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
    class SettingsController
    {
        public void AddSettings(CustomSettings s)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<CustomSettings>();
                rep.Insert(s);
            }
        }

        public CustomSettings LoadSingleSettings(int settingsId)
        {
            CustomSettings s;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<CustomSettings>();
                s = rep.GetById(settingsId);
            }
            return s;
        }

        public IEnumerable<CustomSettings> LoadSettings()
        {
            IEnumerable<CustomSettings> s;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<CustomSettings>();
                s = rep.Get();
            }
            return s;
        }

        public void UpdateSettings(CustomSettings s)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<CustomSettings>();
                rep.Update(s);
            }
        }
    }
}