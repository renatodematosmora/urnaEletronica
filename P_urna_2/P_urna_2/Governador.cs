using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace P_urna_2
{
    public partial class Governador : Form
    {
        public Governador()
        {
            InitializeComponent();
        }

        private void BtnConfirma_Click(object sender, EventArgs e)
        {
            Presidente frm = new Presidente();
            Thread.Sleep(500);
            frm.ShowDialog();
            frm = null;
        }
    }
}
