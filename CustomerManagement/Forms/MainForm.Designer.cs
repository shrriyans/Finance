namespace CustomerManagement.Forms
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblTitle = new System.Windows.Forms.Label();
            this.btnCustomerMaster = new System.Windows.Forms.Button();
            this.btnCityMaster = new System.Windows.Forms.Button();
            this.btnReferenceMaster = new System.Windows.Forms.Button();
            this.btnLogout = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Bold);
            this.lblTitle.Location = new System.Drawing.Point(80, 30);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(240, 26);
            this.lblTitle.TabIndex = 0;
            this.lblTitle.Text = "Customer Management";
            // 
            // btnCustomerMaster
            // 
            this.btnCustomerMaster.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnCustomerMaster.Location = new System.Drawing.Point(100, 80);
            this.btnCustomerMaster.Name = "btnCustomerMaster";
            this.btnCustomerMaster.Size = new System.Drawing.Size(200, 40);
            this.btnCustomerMaster.TabIndex = 1;
            this.btnCustomerMaster.Text = "Customer Master";
            this.btnCustomerMaster.UseVisualStyleBackColor = true;
            this.btnCustomerMaster.Click += new System.EventHandler(this.btnCustomerMaster_Click);
            // 
            // btnCityMaster
            // 
            this.btnCityMaster.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnCityMaster.Location = new System.Drawing.Point(100, 140);
            this.btnCityMaster.Name = "btnCityMaster";
            this.btnCityMaster.Size = new System.Drawing.Size(200, 40);
            this.btnCityMaster.TabIndex = 2;
            this.btnCityMaster.Text = "City Master";
            this.btnCityMaster.UseVisualStyleBackColor = true;
            this.btnCityMaster.Click += new System.EventHandler(this.btnCityMaster_Click);
            // 
            // btnReferenceMaster
            // 
            this.btnReferenceMaster.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnReferenceMaster.Location = new System.Drawing.Point(100, 200);
            this.btnReferenceMaster.Name = "btnReferenceMaster";
            this.btnReferenceMaster.Size = new System.Drawing.Size(200, 40);
            this.btnReferenceMaster.TabIndex = 3;
            this.btnReferenceMaster.Text = "Reference Master";
            this.btnReferenceMaster.UseVisualStyleBackColor = true;
            this.btnReferenceMaster.Click += new System.EventHandler(this.btnReferenceMaster_Click);
            // 
            // btnLogout
            // 
            this.btnLogout.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnLogout.Location = new System.Drawing.Point(100, 280);
            this.btnLogout.Name = "btnLogout";
            this.btnLogout.Size = new System.Drawing.Size(200, 40);
            this.btnLogout.TabIndex = 4;
            this.btnLogout.Text = "Logout";
            this.btnLogout.UseVisualStyleBackColor = true;
            this.btnLogout.Click += new System.EventHandler(this.btnLogout_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(400, 350);
            this.Controls.Add(this.btnLogout);
            this.Controls.Add(this.btnReferenceMaster);
            this.Controls.Add(this.btnCityMaster);
            this.Controls.Add(this.btnCustomerMaster);
            this.Controls.Add(this.lblTitle);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Main Menu - Customer Management";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.Button btnCustomerMaster;
        private System.Windows.Forms.Button btnCityMaster;
        private System.Windows.Forms.Button btnReferenceMaster;
        private System.Windows.Forms.Button btnLogout;
    }
}