# Icon generation — design- and code-friendly prompt

Purpose: concise, reusable prompt for generating app icons (SVG / PNG / VectorDrawable) and adaptive launcher icons for Android. Designed to work with LLMs (Copilot Chat) and image generation models (Stable Diffusion, DALL·E, etc.).

Use this prompt to:
- Create consistent, accessible, and platform-ready icons
- Produce SVG markup, or Android VectorDrawable XML
- Produce image-generation prompts for raster or vector outputs (PNG/SVG)

Important constraints (project-specific):
- Prefer vector first (SVG or Android VectorDrawable) whenever possible
- Keep icons simple and legible at small sizes (24x24, 48x48)
- Provide transparent backgrounds for app icons when requested
- Use the project's color palette or provide color recommendations with hex codes

Android-specific sizing & placements (copyable checklist):
- Action / UI icons (small): 24x24dp (provide at 1x and convert to densities)
- Launcher icons (classic mipmap): mdpi 48×48 px, hdpi 72×72 px, xhdpi 96×96 px, xxhdpi 144×144 px, xxxhdpi 192×192 px
- Adaptive icons: provide separate `foreground` and `background` layers (foreground should be centered and respect a safe zone so system masks work correctly)

File locations / naming (Android):
- Place vector drawables in `app/src/main/res/drawable/` as `ic_<name>.xml` (e.g., `ic_search.xml`)
- Launcher images go in `app/src/main/res/mipmap-*/ic_launcher.png` (or `ic_launcher_foreground.xml` for adaptive foreground vector)

How to ask the model (pattern):
1. Identify the icon purpose and scale level (UI control vs launcher)
2. Ask for output format(s) required (SVG, VectorDrawable XML, PNG at specific sizes)
3. Provide style constraints (flat / minimal / outline / filled / rounded corners)
4. Give color palette or allow suggestions and ask for hex codes
5. Request alt text, accessibility notes, and filename + path

Examples you can copy

1) Generate a small UI icon (SVG + VectorDrawable)

"Create a simple, single-color `search` icon for app UI (24x24). Provide:
- a clean SVG with viewBox 0 0 24 24 and a compact single-path <path> with stroke/fill suited for small display
- an Android VectorDrawable conversion XML with the same geometry
- a recommended filename `app/src/main/res/drawable/ic_search.xml` and one-line alt text for accessibility
Constraints: stroke width appropriate for 24px, single color (use #1F2937 or suggest a high-contrast color)."

2) Produce an adaptive launcher icon (foreground + background)

"Design an app launcher icon for feature 'Notes' — style: flat, minimal, rounded corners, primary accent color #0057D9. Provide:
- a foreground SVG (transparent background) that is centered and can be used as the adaptive foreground
- a solid background color suggestion and hex for the background layer
- export-ready PNG files for mipmap sizes: 192x192, 144x144, 96x96, 72x72, 48x48
- alt text and recommended filenames: `mipmap-xxxhdpi/ic_launcher.png`, `drawable/ic_launcher_foreground.xml` (VectorDrawable if suitable)
Constraints: simple silhouette, good contrast at small sizes, no excessive detail in the foreground layer."

3) Image-generation prompt for a model like DALL·E/SD

"Create a clean, flat-style SVG icon for a 'sync' action. Requirements:
- Transparent background
- Simple two-tone palette: primary #0EA5E9, secondary #0F172A (dark)
- Focus on a minimalist circular arrow symbol, centered, stroke style, no text
- Provide outputs: SVG (optimized), PNG 512x512, PNG 256x256
- Include the icon's suggested filename(s), recommended scale, and one-line accessibility description
Negative prompts: avoid photorealism, gradients, glows, text, heavy shadows."

Additional tips for the model
- Always include the primary color hex code and alternate suggestions
- For VectorDrawable: prefer path data that keeps the viewBox within 24x24 or 48x48 for UI icons
- For adaptive icons: ensure foreground has no overflow and respects center-safe area

When to use this prompt
- Creating new UI/system icons (toolbar, nav) or launcher assets
- Converting a visual design to a platform-ready VectorDrawable
- Generating inspiration or finished PNG/SVG assets from image models

Troubleshooting
- If the icon looks fuzzy at small sizes, ask the model to simplify shapes and increase stroke contrast
- If VectorDrawable XML doesn't render, ask for simplified paths with integer coordinates or a single path instead of many compounds

Copy/paste quick templates

- Minimal UI icon → SVG + VectorDrawable
  "Create a minimal {icon_name} UI icon sized 24x24. Output SVG (viewBox 0 0 24 24) + Android VectorDrawable XML. Single color {hex} suitable for dark & light backgrounds. Provide file path and alt text."

- Launcher adaptive icon
  "Create an adaptive launcher icon for '{app_name}' with a flat style focusing on {theme}. Output: foreground SVG (transparent), suggested background color, PNG exports for mdpi/hdpi/xhdpi/xxhdpi/xxxhdpi and recommended filenames."

Use this prompt with Copilot, Copilot Chat, or any image model. Update the prompt over time to match brand style and platform requirements.
