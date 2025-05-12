<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport">
                    <xsl:attribute name="content">
                        <xsl:value-of select="application/metadata/viewport"/>
                    </xsl:attribute>
                </meta>
                <title><xsl:value-of select="application/metadata/title"/></title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
                        background-color: #2a2a2a;
                        color: #e5e5e5;
                        height: 100vh;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        padding: 20px;
                    }

                    .container {
                        width: 100%;
                        max-width: 700px;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 40px;
                    }

                    h1 {
                        font-size: 48px;
                        font-weight: 300;
                        color: #e5e5e5;
                        text-align: center;
                        margin-bottom: 0;
                    }

                    .icon {
                        width: 48px;
                        height: 48px;
                        background: linear-gradient(45deg, #ff6b6b, #feca57);
                        border-radius: 50%;
                        display: inline-block;
                        vertical-align: middle;
                        margin-right: 16px;
                    }

                    .form-container,
                    .config-container {
                        width: 100%;
                        position: relative;
                    }

                    form {
                        width: 100%;
                    }

                    .textarea-wrapper {
                        position: relative;
                        width: 100%;
                    }

                    textarea {
                        width: 100%;
                        background-color: #3a3a3a;
                        border: 1px solid #4a4a4a;
                        border-radius: 24px;
                        color: #e5e5e5;
                        font-size: 16px;
                        padding-top: 20px;
                        padding-left: 12px;
                        padding-bottom: 60px;
                        padding-right: 140px;
                        resize: none;
                        outline: none;
                        font-family: inherit;
                        line-height: 1.5;
                        min-height: 96px;
                        max-height: 400px;
                        overflow-y: auto;
                        transition: border-color 0.2s ease;
                    }

                    textarea:focus {
                        border-color: #6a6a6a;
                    }

                    textarea::placeholder {
                        color: #8a8a8a;
                    }

                    .left-button-container {
                        position: absolute;
                        bottom: 12px;
                        left: 12px;
                        display: flex;
                        gap: 8px;
                        align-items: center;
                        z-index: 1;
                    }

                    .button-container {
                        position: absolute;
                        bottom: 12px;
                        right: 12px;
                        display: flex;
                        gap: 8px;
                        align-items: center;
                    }

                    button {
                        background-color: transparent;
                        border: none;
                        cursor: pointer;
                        padding: 8px;
                        border-radius: 8px;
                        border: 0.5px #e5e5e575 solid;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        transition: background-color 0.2s ease;
                    }

                    button:hover {
                        background-color: #4a4a4a;
                    }

                    .submit-button {
                        background-color: #e5e5e5;
                        color: #2a2a2a;
                        font-weight: 500;
                        padding: 8px 16px;
                        border-radius: 20px;
                        font-size: 14px;
                        display: flex;
                        align-items: center;
                        gap: 4px;
                    }

                    .submit-button:hover {
                        background-color: #d5d5d5;
                    }

                    .submit-button:disabled {
                        opacity: 0.5;
                        cursor: not-allowed;
                    }

                    .submit-button:disabled:hover {
                        background-color: #e5e5e5;
                    }

                    .icon-button svg {
                        width: 20px;
                        height: 20px;
                        stroke: #e5e5e5;
                        fill: white;
                        color: #e5e5e5;
                        stroke-width: 2;
                    }

                    .model-tag {
                        color: #8a8a8a;
                        font-size: 14px;
                        margin-left: 8px;
                    }

                    /* Config view styles */
                    .config-container {
                        display: none;
                        background-color: #3a3a3a;
                        border: 1px solid #4a4a4a;
                        border-radius: 24px;
                        padding: 24px;
                    }

                    .config-container.active {
                        display: block;
                    }

                    .config-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 20px;
                    }

                    .config-title {
                        font-size: 20px;
                        font-weight: 500;
                    }

                    .config-form {
                        display: flex;
                        flex-direction: column;
                        gap: 16px;
                    }

                    .config-field {
                        display: flex;
                        flex-direction: column;
                        gap: 8px;
                    }

                    .config-label {
                        font-size: 14px;
                        color: #b5b5b5;
                    }

                    .config-input {
                        background-color: #2a2a2a;
                        border: 1px solid #4a4a4a;
                        border-radius: 8px;
                        color: #e5e5e5;
                        font-size: 16px;
                        padding: 10px 12px;
                        outline: none;
                        font-family: inherit;
                        transition: border-color 0.2s ease;
                    }

                    .config-input:focus {
                        border-color: #6a6a6a;
                    }

                    .config-buttons {
                        display: flex;
                        gap: 12px;
                        margin-top: 16px;
                    }

                    .config-button {
                        padding: 10px 20px;
                        border-radius: 20px;
                        font-size: 14px;
                        font-weight: 500;
                        border: none;
                        cursor: pointer;
                        transition: all 0.2s ease;
                    }

                    .save-button {
                        background-color: #e5e5e5;
                        color: #2a2a2a;
                    }

                    .save-button:hover {
                        background-color: #d5d5d5;
                    }

                    .cancel-button {
                        background-color: transparent;
                        color: #e5e5e5;
                        border: 1px solid #4a4a4a;
                    }

                    .cancel-button:hover {
                        background-color: #4a4a4a;
                    }

                    /* Scrollbar styling */
                    textarea::-webkit-scrollbar {
                        width: 8px;
                    }

                    textarea::-webkit-scrollbar-track {
                        background: transparent;
                    }

                    textarea::-webkit-scrollbar-thumb {
                        background-color: #5a5a5a;
                        border-radius: 4px;
                    }

                    textarea::-webkit-scrollbar-thumb:hover {
                        background-color: #6a6a6a;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>
                        <span class="icon"></span>
                        <xsl:value-of select="application/branding/heading"/>
                    </h1>

                    <div class="form-container" id="formView">
                        <xsl:apply-templates select="application/main-interface/prompt-form"/>
                    </div>

                    <xsl:apply-templates select="application/configuration-panel"/>
                </div>

                <script>
                    const textarea = document.getElementById('promptTextarea');
                    const submitButton = document.getElementById('submitButton');
                    const form = document.getElementById('promptForm');
                    const formView = document.getElementById('formView');
                    const configView = document.getElementById('configView');
                    const configButton = document.getElementById('configButton');
                    const addUrlButton = document.getElementById('addUrlButton');
                    const saveConfigButton = document.getElementById('saveConfigButton');
                    const cancelConfigButton = document.getElementById('cancelConfigButton');
                    const modelInput = document.getElementById('modelInput');
                    const basePathInput = document.getElementById('basePathInput');
                    const apiKeyInput = document.getElementById('apiKeyInput');

                    // Load config from localStorage
                    function loadConfig() {
                        const config = {
                            model: localStorage.getItem('model') || '',
                            basePath: localStorage.getItem('basePath') || '',
                            apiKey: localStorage.getItem('apiKey') || ''
                        };
                        modelInput.value = config.model;
                        basePathInput.value = config.basePath;
                        apiKeyInput.value = config.apiKey;
                        return config;
                    }

                    // Save config to localStorage
                    function saveConfig() {
                        localStorage.setItem('model', modelInput.value);
                        localStorage.setItem('basePath', basePathInput.value);
                        localStorage.setItem('apiKey', apiKeyInput.value);
                    }

                    // Auto-resize textarea
                    function adjustTextareaHeight() {
                        textarea.style.height = 'auto';
                        textarea.style.height = textarea.scrollHeight + 'px';
                    }

                    // Insert URL at cursor position
                    function insertUrlAtCursor(url) {
                        const start = textarea.selectionStart;
                        const end = textarea.selectionEnd;
                        const text = textarea.value;
                        const before = text.substring(0, start);
                        const after = text.substring(end);

                        // Add newline if there's text before and it doesn't end with newline
                        const prefix = before &amp;&amp; !before.endsWith('\n') ? '\n' : '';
                        // Add newline if there's text after and it doesn't start with newline
                        const suffix = after &amp;&amp; !after.startsWith('\n') ? '\n' : '';

                        textarea.value = before + prefix + url + suffix + after;

                        // Set cursor position after the inserted URL
                        const newPosition = start + prefix.length + url.length;
                        textarea.setSelectionRange(newPosition, newPosition);
                        textarea.focus();

                        adjustTextareaHeight();
                        submitButton.disabled = textarea.value.trim() === '';
                    }

                    // Event listeners
                    textarea.addEventListener('input', () => {
                        adjustTextareaHeight();
                        submitButton.disabled = textarea.value.trim() === '';
                    });

                    // Handle shift+enter for newline, enter for submit
                    textarea.addEventListener('keydown', (e) => {
                        if (e.key === 'Enter' &amp;&amp; !e.shiftKey) {
                            e.preventDefault();
                            if (textarea.value.trim()) {
                                form.dispatchEvent(new Event('submit'));
                            }
                        }
                    });

                    // Add URL button click
                    addUrlButton.addEventListener('click', () => {
                        const url = prompt('Enter URL to insert:');
                        if (url) {
                            insertUrlAtCursor(url);
                        }
                    });

                    // Config button click
                    configButton.addEventListener('click', () => {
                        formView.style.display = 'none';
                        configView.classList.add('active');
                        loadConfig();
                    });

                    // Save config button click
                    saveConfigButton.addEventListener('click', () => {
                        saveConfig();
                        configView.classList.remove('active');
                        formView.style.display = 'block';
                    });

                    // Cancel config button click
                    cancelConfigButton.addEventListener('click', () => {
                        configView.classList.remove('active');
                        formView.style.display = 'block';
                    });

                    // Slugify function
                    function slugify(text) {
                        return text
                            .toLowerCase()
                            .trim()
                            .replace(/[^\w\s-]/g, '')
                            .replace(/[\s_-]+/g, '-')
                            .replace(/^-+|-+$/g, '');
                    }

                    // Simple hash function for 7-character SHA-like string
                    function simpleHash(str) {
                        let hash = 0;
                        for (let i = 0; i &lt; str.length; i++) {
                            const char = str.charCodeAt(i);
                            hash = ((hash &lt;&lt; 5) - hash) + char;
                            hash = hash &amp; hash;
                        }
                        return Math.abs(hash).toString(36).substring(0, 7).padEnd(7, '0');
                    }

                    // Handle form submission
                    form.addEventListener('submit', (e) => {
                        e.preventDefault();

                        const promptText = textarea.value.trim();
                        if (!promptText) return;

                        // Generate slug from first 20 characters
                        const first20 = promptText.substring(0, 20);
                        const slug = slugify(first20);
                        const hash = simpleHash(promptText);

                        // Create the URL path
                        const path = `/${slug}-${hash}`;

                        // Update form action
                        form.action = path;

                        // Create form data with config values
                        const formData = new FormData();
                        formData.append('prompt', promptText);

                        const config = loadConfig();
                        formData.append('model', config.model);
                        formData.append('basePath', config.basePath);
                        formData.append('apiKey', config.apiKey);

                        // Submit the form (in a real app, you'd submit to your server)
                        console.log('Submitting to:', path);
                        console.log('Form data:', {
                            prompt: promptText,
                            model: config.model,
                            basePath: config.basePath,
                            apiKey: config.apiKey
                        });

                        // For demo purposes, we'll just log the data
                        // In production, uncomment the next line:
                        form.submit();

                        // Reset form after submission
                        textarea.value = '';
                        adjustTextareaHeight();
                        submitButton.disabled = true;
                    });

                    // Initialize
                    adjustTextareaHeight();
                    submitButton.disabled = true;
                    loadConfig();
                </script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="prompt-form">
        <form>
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
            <div class="textarea-wrapper">
                <xsl:apply-templates select="textarea-section"/>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="textarea-section">
        <xsl:apply-templates select="controls[@position='left']"/>
        <xsl:apply-templates select="prompt-input"/>
        <xsl:apply-templates select="controls[@position='right']"/>
    </xsl:template>

    <xsl:template match="controls[@position='left']">
        <div class="left-button-container">
            <xsl:apply-templates select="button"/>
        </div>
    </xsl:template>

    <xsl:template match="controls[@position='right']">
        <div class="button-container">
            <xsl:apply-templates select="submit-button"/>
        </div>
    </xsl:template>

    <xsl:template match="button[@type='icon']">
        <button type="button" class="icon-button">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="tooltip"/></xsl:attribute>
            <xsl:apply-templates select="icon"/>
        </button>
    </xsl:template>

    <xsl:template match="icon[@type='plus']">
        <svg viewBox="0 0 24 24">
            <path d="M12 5v14M5 12h14" stroke="currentColor" />
        </svg>
    </xsl:template>

    <xsl:template match="icon[@type='menu-dots']">
        <svg viewBox="0 0 24 24">
            <path d="M12 6h.01M12 12h.01M12 18h.01" stroke="currentColor" stroke-linecap="round" />
        </svg>
    </xsl:template>

    <xsl:template match="icon[@type='arrow-up']">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
            <path d="M7 11l5-5 5 5M12 6v12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
        </svg>
    </xsl:template>

    <xsl:template match="prompt-input">
        <textarea>
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:attribute name="name">prompt</xsl:attribute>
            <xsl:attribute name="placeholder"><xsl:value-of select="@placeholder"/></xsl:attribute>
            <xsl:attribute name="rows">3</xsl:attribute>
        </textarea>
    </xsl:template>

    <xsl:template match="submit-button">
        <button type="submit" class="submit-button">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:if test="@disabled='true'">
                <xsl:attribute name="disabled">disabled</xsl:attribute>
            </xsl:if>
            <span><xsl:value-of select="text"/></span>
            <xsl:apply-templates select="icon"/>
        </button>
    </xsl:template>

    <xsl:template match="configuration-panel">
        <div class="config-container">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:if test="@visible='false'">
                <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>
            <div class="config-header">
                <div class="config-title"><xsl:value-of select="header/title"/></div>
            </div>
            <div class="config-form">
                <xsl:apply-templates select="config-form/field"/>
                <div class="config-buttons">
                    <xsl:apply-templates select="config-form/actions/button"/>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="field">
        <div class="config-field">
            <label class="config-label">
                <xsl:attribute name="for"><xsl:value-of select="input/@id"/></xsl:attribute>
                <xsl:value-of select="label"/>
            </label>
            <input class="config-input">
                <xsl:attribute name="type"><xsl:value-of select="input/@type"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="input/@id"/></xsl:attribute>
                <xsl:attribute name="placeholder"><xsl:value-of select="input/@placeholder"/></xsl:attribute>
            </input>
        </div>
    </xsl:template>

    <xsl:template match="button[@type='primary']">
        <button class="config-button save-button">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:value-of select="."/>
        </button>
    </xsl:template>

    <xsl:template match="button[@type='secondary']">
        <button class="config-button cancel-button">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:value-of select="."/>
        </button>
    </xsl:template>

</xsl:stylesheet>