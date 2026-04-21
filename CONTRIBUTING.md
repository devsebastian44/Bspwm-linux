# Contributing to Bspwm-linux

¡Gracias por tu interés en contribuir a este repositorio! Este proyecto pretende ser un entorno reproducible, robusto y modular de Bspwm para la comunidad.

Para asegurar la calidad del portafolio y del código colaborativo, por favor sigue estas directrices:

## 1. Entorno de Desarrollo Local

Puedes probar los cambios sin afectar a tu sistema principal.

1. Haz **Fork** del repositorio a tu propia cuenta de GitHub.
2. Clona tu fork localmente:
   ```bash
   git clone https://github.com/TU_USUARIO/Bspwm-linux.git
   cd Bspwm-linux
   ```
3. (Opcional pero recomendado) Puedes probar la instalación dentro de una máquina virtual (ej. VirtualBox) o usando contenedores Docker específicos para entornos gráficos si conoces el flujo, para evitar pisar tu propia configuración en `~/.config/`.
4. Copia el archivo de entorno y configura lo que necesites:
   ```bash
   cp .env.example .env
   ```
   *(Nota: Actualmente el sistema no requiere un `.env` real, se provee como mock para futuros scripts o integraciones de polybar).*

## 2. Pruebas Funcionales (Local Tests)

Antes de enviar tus cambios, asegúrate de que el código no está roto:

```bash
# Ejecutar prueba de sintaxis seca (sin realizar cambios en el sistema)
bash tests/test_install.sh
```

Si haces cambios en `scripts/install.sh`, también te recomendamos usar `shellcheck` localmente:
```bash
shellcheck scripts/install.sh
```

## 3. Pull Requests (PRs)

Para que tu PR sea válido y procesado:
- Crea una rama descriptiva (`git checkout -b feature/nueva-barra-polybar`).
- Asegúrate de que las pruebas locales (sintaxis y tests de `tests/`) pasen correctamente.
- **GitHub Actions** verificará automáticamente la integridad del código al momento de crear el PR.
- No incluyas variables sensibles, credenciales, tokens personales de APIs (como en Polybar), ni configuraciones que estén atadas estrictamente a tu máquina y no sean generales.
- En la descripción del PR, explica qué soluciona tu cambio y cómo probarlo.

## 4. Estilo de Código
- Los scripts Bash deben seguir buenas prácticas y convenciones estándar (usa `shellcheck` como guía).
- Los archivos de configuración (dotfiles) deben estar documentados con comentarios breves donde corresponda para ayudar a otros a entender los cambios (ej. `# Configuración de transparencias de kitty`).

¡Agradecemos cualquier contribución que ayude a mejorar este entorno!
