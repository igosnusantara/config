# IGOS Nusantara (IGN) 2026 Configuration 🚀

Repositori ini berisi kumpulan konfigurasi standar (*dotfiles*) untuk lingkungan terminal **IGOS Nusantara 2026**, yang juga kompatibel dengan distro Linux lainnya seperti Fedora, AlmaLinux, Ubuntu, dan Debian.

## 📋 Daftar Konfigurasi
- **Bash**: Prompt berwarna, alias praktis, dan optimasi shell.
- **Tmux**: Status bar kustom, dukungan mouse, dan navigasi panel yang mudah.
- **Fastfetch**: Logo ASCII resmi IGOS Nusantara.
- **Conky**: Pemantauan sistem ringan untuk desktop.

---

## 🛠️ Cara Instalasi Otomatis (Direkomendasikan)

Gunakan skrip instalasi untuk melakukan backup konfigurasi lama dan memasang konfigurasi baru secara otomatis:

```bash
mkdir -p ~/git && cd ~/git
git clone [https://github.com/igosnusantara/c.git](https://github.com/igosnusantara/c.git)
cd c
chmod +x install.sh
./install.sh
