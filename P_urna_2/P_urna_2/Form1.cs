using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Repositorio;
using System.Threading;

namespace P_urna_2
{
    public partial class Form1 : Form
    {

        List<Panel> listaPanel = new List<Panel>();
        public int contadorTela = 0;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            listaPanel.Add(PanelDF);
            listaPanel.Add(panelDE);
            listaPanel.Add(panelSE1);
            listaPanel.Add(panelSE2);
            listaPanel.Add(panelGO);
            listaPanel.Add(panelPR);
            listaPanel.Add(panelFIM);
            listaPanel[contadorTela].BringToFront();
            Txt1_df.Focus();
        }

        private string concatenar(int contador){
            string numcand = "";
            if (contador == 0){
                return numcand = (Txt1_df.Text + Txt2_df.Text + Txt3_df.Text + Txt4_df.Text);
            }
             else if (contador == 1)
            {
                return numcand = (Txt1_de.Text + Txt2_de.Text + Txt3_de.Text + Txt4_de.Text + Txt5_de.Text);
            }
            else if (contador == 2)
            {
                return numcand = (Txt1_se.Text + Txt2_se.Text + Txt3_se.Text);
            }
            else if (contador == 3)
            {
                return numcand = (Txt1_se2.Text + Txt2_se2.Text + Txt3_se2.Text);
            }
            else if (contador == 4)
            {
                return numcand = (Txt1_go.Text + Txt2_go.Text);
            }
            else if (contador == 5)
            {
                return numcand = (Txt1_pr.Text + Txt2_pr.Text);
            }
            else
            {
                return numcand;
            }
        }

        //Mudar o foco do textbox do Deputado Federal.
        private void Txt1_df_KeyUp(object sender, KeyEventArgs e)
        {
            Txt2_df.Focus();
        }

        private void Txt2_df_KeyUp(object sender, KeyEventArgs e)
        {
            Txt3_df.Focus();
        }

        private void Txt3_df_KeyUp(object sender, KeyEventArgs e)
        {
            Txt4_df.Focus();
        }

        private void Txt4_df_KeyUp(object sender, KeyEventArgs e)
        {
            string numcand = concatenar(contadorTela);
            buscaCandidato(numcand);
        }

        //Mudar o foco do textbox do Deputado Estadual.
        private void Txt1_de_KeyUp(object sender, KeyEventArgs e)
        {
            Txt2_de.Focus();
        }

        private void Txt2_de_KeyUp(object sender, KeyEventArgs e)
        {
            Txt3_de.Focus();
        }

        private void Txt3_de_KeyUp(object sender, KeyEventArgs e)
        {
            Txt4_de.Focus();
        }

        private void Txt4_de_KeyUp(object sender, KeyEventArgs e)
        {
            Txt5_de.Focus();
        }

        private void Txt5_de_KeyUp(object sender, KeyEventArgs e)
        {
            string numcand = concatenar(contadorTela);
            buscaCandidato(numcand);
        }

        //Mudar o foco do textbox do Senador1.
        private void Txt1_se_KeyUp(object sender, KeyEventArgs e)
        {
            Txt2_se.Focus();
        }

        private void Txt2_se_KeyUp(object sender, KeyEventArgs e)
        {
            Txt3_se.Focus();
        }

        private void Txt3_se_KeyUp(object sender, KeyEventArgs e)
        {
            string numcand = concatenar(contadorTela);
            buscaCandidato(numcand);
        }

        //Mudar o foco do textbox do Senador2.
        private void Txt1_se2_KeyUp(object sender, KeyEventArgs e)
        {
            Txt2_se2.Focus();
        }

        private void Txt2_se2_KeyUp(object sender, KeyEventArgs e)
        {
            Txt3_se2.Focus();
        }

        private void Txt3_se2_KeyUp(object sender, KeyEventArgs e)
        {
            string numcand = concatenar(contadorTela);
            buscaCandidato(numcand);
        }

        //Mudar o foco do textbox do Governador.
        private void Txt1_go_KeyUp(object sender, KeyEventArgs e)
        {
            Txt2_go.Focus();
        }

        private void Txt2_go_KeyUp(object sender, KeyEventArgs e)
        {
            string numcand = concatenar(contadorTela);
            buscaCandidato(numcand);
        }

        //Mudar o foco do textbox do Presidente.
        private void Txt1_pr_KeyUp(object sender, KeyEventArgs e)
        {
            Txt2_pr.Focus();
        }

        private void Txt2_pr_KeyUp(object sender, KeyEventArgs e)
        {
            string numcand = concatenar(contadorTela);
            buscaCandidato(numcand);
        }

        private void btn_confirma_Click(object sender, EventArgs e)
        {
            if(contadorTela == 0)
            {
                votos voto = new votos()
                {
                    data_voto = DateTime.Now.Date,
                    codigo_candidato = int.Parse(label_numcandDF.Text)
                };
                (new VotarRepositorio()).inserir(voto);
            }
            else if(contadorTela == 1)
            {
                votos voto = new votos()
                {
                    data_voto = DateTime.Now.Date,
                    codigo_candidato = int.Parse(label_numcandDE.Text)
                };
                (new VotarRepositorio()).inserir(voto);
            }
            else if(contadorTela == 2)
            {
                votos voto = new votos()
                {
                    data_voto = DateTime.Now.Date,
                    codigo_candidato = int.Parse(label_numcandSE.Text)
                };
                (new VotarRepositorio()).inserir(voto);
            }
            else if(contadorTela == 3)
            {
                votos voto = new votos()
                {
                    data_voto = DateTime.Now.Date,
                    codigo_candidato = int.Parse(label_numcandSE2.Text)
                };
                (new VotarRepositorio()).inserir(voto);
            }
            else if(contadorTela == 4)
            {
                votos voto = new votos()
                {
                    data_voto = DateTime.Now.Date,
                    codigo_candidato = int.Parse(label_numcandGO.Text)
                };
                (new VotarRepositorio()).inserir(voto);
            }
            else if(contadorTela == 5)
            {
                votos voto = new votos()
                {
                    data_voto = DateTime.Now.Date,
                    codigo_candidato = int.Parse(label_numcandPR.Text)
                };
                (new VotarRepositorio()).inserir(voto);
            }
            System.Media.SoundPlayer player = new System.Media.SoundPlayer();
            player.SoundLocation = "C:/Users/Renat/Documents/Documentos-Renato/Banco de Dados II/Aula12/P_urna_2/confirma.wav";
            player.Load();
            player.Play();
            if(contadorTela < listaPanel.Count - 1)
            {
                listaPanel[++contadorTela].BringToFront();
                if (contadorTela == 1)
                {
                    Txt1_de.Focus();
                }
                else if (contadorTela == 2)
                {
                    Txt1_se.Focus();
                }
                else if (contadorTela == 3)
                {
                    Txt1_se2.Focus();
                }
                else if (contadorTela == 4)
                {
                    Txt1_go.Focus();
                }
                else if (contadorTela == 5)
                {
                    Txt1_pr.Focus();
                }
                else if(contadorTela == 6)
                {
                    player.Play();
                }
            }
            else
            {
                Txt1_df.Text = "";
                Txt2_df.Text = "";
                Txt3_df.Text = "";
                Txt4_df.Text = "";
                Txt1_de.Text = "";
                Txt2_de.Text = "";
                Txt3_de.Text = "";
                Txt4_de.Text = "";
                Txt5_de.Text = "";
                Txt1_se.Text = "";
                Txt2_se.Text = "";
                Txt3_se.Text = "";
                Txt1_se2.Text = "";
                Txt2_se2.Text = "";
                Txt3_se2.Text = "";
                Txt1_go.Text = "";
                Txt2_go.Text = "";
                Txt1_pr.Text = "";
                Txt2_pr.Text = "";
                nome_df.Visible = false;
                nome_de.Visible = false;
                nome_se.Visible = false;
                nome_se2.Visible = false;
                nome_go.Visible = false;
                nome_pr.Visible = false;
                contadorTela = 0;
                listaPanel[contadorTela].BringToFront();
            }
        }

        private void buscaCandidato(string numcand)
        {
            if (contadorTela == 0)
            {
                candidato can = (new CandidatoRepositorio()).selecionarDF(numcand);
                if (can != null)
                {
                    label_numcandDF.Text = can.codigo_candidato.ToString();
                    nome_df.Text = can.nome_candidato;
                    nome_df.Visible = true;
                }
            }
            else if (contadorTela == 1)
            {
                candidato can = (new CandidatoRepositorio()).selecionarDE(numcand);
                if (can != null)
                {
                    label_numcandDE.Text = can.codigo_candidato.ToString();
                    nome_de.Text = can.nome_candidato;
                    nome_de.Visible = true;
                }
            }
            else if (contadorTela == 2)
            {
                candidato can = (new CandidatoRepositorio()).selecionarSE(numcand);
                if (can != null)
                {
                    label_numcandSE.Text = can.codigo_candidato.ToString();
                    nome_se.Text = can.nome_candidato;
                    nome_se.Visible = true;
                }
            }
            else if (contadorTela == 3)
            {
                candidato can = (new CandidatoRepositorio()).selecionarSE(numcand);
                if (can != null)
                {
                    label_numcandSE2.Text = can.codigo_candidato.ToString();
                    nome_se2.Text = can.nome_candidato;
                    nome_se2.Visible = true;
                }
            }
            else if (contadorTela == 4)
            {
                candidato can = (new CandidatoRepositorio()).selecionarGO(numcand);
                if (can != null)
                {
                    label_numcandGO.Text = can.codigo_candidato.ToString();
                    nome_go.Text = can.nome_candidato;
                    nome_go.Visible = true;
                }
            }
            else if (contadorTela == 5)
            {
                candidato can = (new CandidatoRepositorio()).selecionarPR(numcand);
                if (can != null)
                {
                    label_numcandPR.Text = can.codigo_candidato.ToString();
                    nome_pr.Text = can.nome_candidato;
                    nome_pr.Visible = true;
                }
            }
        }
    }
}
