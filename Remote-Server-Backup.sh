# Remote-Server-Backup.sh
#
#
# rsync tool to download server data
# from [Remote Linux Server name] to [Windows Backup Machine]
#
#
# download only those files on [Remote Linux Server name] in
#
#[server directory]
# Only files that are newer than what is already on the
#
#[Windows Backup Machine Directory]
#
# Syntax
#
# rsync -avzu [user name]@[Remote Linux Server name]:
#[server directory] [Windows Backup Machine Directory]
# Windows Shortcut Target Should be
#C:cygwin64binbash.exe --login -i '/bin/Remote-Server-Backup.sh'
echo "=================================================================="
echo "Backup Data Foto KIB"
echo "Tunggu hingga program ini close sendiri....."
echo "=================================================================="
echo "=================================================================="
echo "=================================================================="
echo "=================================================================="
# Tentukan direktori SSH
SSH_DIR="$HOME/.ssh"
PRIVATE_KEY="$SSH_DIR/id_rsa"
PUBLIC_KEY="$PRIVATE_KEY.pub"
if [ ! -d "$SSH_DIR" ]; then
    echo "Membuat direktori .ssh..."
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"
    echo "direktori .ssh berhasil dibuat"
else
    echo "SSH Sudah di setting"
fi
# Cek apakah file id_rsa ada
if [ ! -f "$PRIVATE_KEY" ]; then
    echo "Kunci SSH tidak ditemukan. Membuat kunci SSH baru..."
    ssh-keygen -t rsa -b 4096 -f "$PRIVATE_KEY" -N ""  # Membuat kunci SSH tanpa passphrase
    chmod 600 "$PRIVATE_KEY"
    chmod 644 "$PUBLIC_KEY"
    echo "Kunci SSH telah dibuat."
else
    echo "Kunci SSH sudah ada."
fi
chmod 777 /hosting-backup
chmod 755 ~ && chmod 700 ~/.ssh/ && chmod 600 ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub && chmod 777 ~/.ssh/known_hosts && echo "Setting Config OKE"
# Tampilkan kunci publik
echo "=========================================================="
echo "Kunci publik:"
cat "$PUBLIC_KEY"
echo "=========================================================="
rsync -av --progress -e 'ssh -p 65002' --exclude={'.git','.oldgit','vendor','node_modules','storage/framework'} u1788367@keamanan-pg.com:/home/u1788367/public_html/ /hosting-backup/
