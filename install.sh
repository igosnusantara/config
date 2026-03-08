#!/bin/bash

# Konfigurasi Skrip Instalasi IGN 2026 (One-Liner Ready)
BASE_URL="https://raw.githubusercontent.com/igosnusantara/config/main"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}===[ Memulai Instalasi Konfigurasi IGN26 dan IGN2026 ]===${NC}"

# Fungsi untuk mengunduh dan memasang konfigurasi
download_and_install() {
    local file_name=$1
    local target_path=$2
    local label=$3

    echo -ne "Memasang $label... "
    
    # Backup file lama jika ada
    if [ -f "$target_path" ]; then
        mv "$target_path" "${target_path}.bak_$(date +%Y%m%d_%H%M%S)"
    fi

    # Unduh file langsung dari GitHub ke lokasi tujuan
    curl -sL "${BASE_URL}/${file_name}" -o "$target_path"
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}BERHASIL${NC}"
    else
        echo -e "${RED}GAGAL${NC}"
    fi
}

# 1. Pastikan curl sudah terpasang (dnf biasanya sudah dilakukan di baris pertama user)
if ! command -v curl &> /dev/null; then
    echo -e "${RED}Error: curl tidak ditemukan. Jalankan 'dnf install curl -y' terlebih dahulu.${NC}"
    exit 1
fi

# 2. Jalankan proses download dan instalasi
download_and_install "bashrc" "$HOME/.bashrc" "Bash Configuration"
download_and_install "tmux.conf" "$HOME/.tmux.conf" "Tmux Configuration"

# 3. Selesai dan Refresh Shell
echo -e "\n${GREEN}Instalasi selesai dengan sukses!${NC}"
echo -e "Menjalankan shell baru untuk mengaktifkan perubahan...\n"

# Otomatis menjalankan bash baru sehingga user tidak perlu mengetik 'source'
exec bash
