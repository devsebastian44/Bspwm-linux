# =============================================================================
# scripts/publish_public.ps1 - Pipeline DevSecOps: GitLab -> GitHub
# Propósito: Sincronización Segura y Sanitización para Portafolio Público
# =============================================================================

Write-Host "[*] Iniciando sincronización profesional DevSecOps..." -ForegroundColor Cyan

# 1. Validaciones Iniciales (Pre-vuelo)
$currentBranch = git rev-parse --abbrev-ref HEAD
if ($currentBranch -ne "main") {
    Write-Host "[!] Error: Debes estar en 'main' para publicar." -ForegroundColor Red
    exit
}

if (git status --porcelain) {
    Write-Host "[!] Tienes cambios sin guardar en el laboratorio. Haz commit antes de publicar." -ForegroundColor Yellow
    exit
}

# 2. Limpieza Local Previa
Write-Host "[*] Limpiando artefactos temporales..." -ForegroundColor Yellow
Remove-Item -Path "*.log", "*.tmp" -Force -ErrorAction SilentlyContinue

# 3. Sincronización con Laboratorio Privado (Source of Truth)
Write-Host "[*] Sincronizando con GitLab (Fuente de Verdad)..."
git pull gitlab main --rebase
git push gitlab main

# 4. Estrategia de Rama Pública (Aislamiento)
Write-Host "[*] Generando versión pública sanitizada en rama 'public'..."
git checkout -B public main

# 5. Filtrado Dinámico de Seguridad (Removiendo componentes privados)
Write-Host "[*] Removiendo componentes de laboratorio (Tests, CI, Configuraciones Reales)..." -ForegroundColor Cyan
git rm -r --cached tests/ -f 2>$null
git rm --cached .gitlab-ci.yml -f 2>$null
git rm --cached scripts/publish_public.ps1 -f 2>$null
# (Opcional: Si quieres que el portafolio tenga los archivos base pero no las 'configs reales' privadas)
# git rm -r --cached configs/ -f 2>$null 
# (Opcional, en caso de mantener scripts de infraestructura privados)
# git rm -r --cached data/packages/ -f 2>$null

# 6. Commit de Sanitización y Push Asegurado a GitHub
git commit -m "docs: release update to public portfolio (sanitized)" --allow-empty
Write-Host "[*] Implementando despliegue de solo-lectura sobre GitHub (origin)..." -ForegroundColor Green
git push origin public:main --force

# 7. Retorno Seguro al Entorno de Laboratorio
Write-Host "[*] Restableciendo entorno local a GitLab-main..."
git checkout main -f
git clean -fd 2>$null

Write-Host "[+] Publicación técnica finalizada correctamente." -ForegroundColor Green
