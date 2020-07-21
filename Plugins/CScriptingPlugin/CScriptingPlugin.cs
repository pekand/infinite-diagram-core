using System;
using Diagram;
using System.Windows.Forms;
using Microsoft.CodeAnalysis.CSharp.Scripting;
using Microsoft.CodeAnalysis.Scripting;
using System.Linq;
using System.Security.Cryptography;

namespace Plugin
{

    public class Globals
    {
        public Tools Script { get; set; }
        public Log Log { get; set; }
        public Diagram.Diagram Diagram { get; set; }
        public Diagram.DiagramView DiagramView { get; set; }
    }


    public class CScriptingPlugin : INodeOpenPlugin, IKeyPressPlugin //UID0290845814
    {
        public string Name
        {
            get
            {
                return "Csharp Scripting Plugin";
            }
        }

        public string Version
        {
            get
            {
                return "1.0";
            }
        }

        private string location = null;

        public void SetLocation(string location)
        {
            this.location = location;
        }

        private Log log = null;

        public void SetLog(Log log)
        {
            this.log = log;
        }

        public bool ClickOnNodeAction(Diagram.Diagram diagram, DiagramView diagramView, Node node)
        {
            if (node.link.Trim() == "#csharp")  // OPEN SCRIPT node with link "script" is executed as script
            {

                String clipboard = Os.GetTextFormClipboard();

                try
                {
                    this.EvaluateAsync(diagram, diagramView, node, clipboard).Wait();
                }
                catch (System.AggregateException ae)
                {
                    ae.Handle(ex =>
                    {
                        Program.log.Write("Exception in embed csharp script: "+ ex.Message);
                        return true;
                    });
                    
                }


                return true;
            }

            return false;
        }

        public bool KeyPressAction(Diagram.Diagram diagram, DiagramView diagramView, Keys keyData)
        {
            return false;
        }

        // SCRIPT evaluate python script in node name or in node note in node
        private async System.Threading.Tasks.Task EvaluateAsync(Diagram.Diagram diagram, DiagramView diagramView, Node node, string clipboard = "")
        {
            string body = node.note;
            System.Threading.Tasks.Task<ScriptState<object>> task = CSharpScript.Create(
                code: body,
                globalsType: typeof(Globals))
            .RunAsync(new Globals { 
                Script = new Tools(diagram, diagramView, node, clipboard), 
                Log = Program.log, 
                Diagram = diagram, 
                DiagramView = diagramView 
            }); ;
        }
        

    }
}
 