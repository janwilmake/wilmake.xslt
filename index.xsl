<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="landing-page/company/n"/> - <xsl:value-of select="landing-page/company/tagline"/></title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }
                    
                    body {
                        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
                        line-height: 1.6;
                        color: #333;
                        background: #f8f9fa;
                    }
                    
                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 0 20px;
                    }
                    
                    /* Header Styles */
                    header {
                        background: #000;
                        color: white;
                        padding: 1rem 0;
                        position: fixed;
                        width: 100%;
                        top: 0;
                        z-index: 1000;
                        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                    }
                    
                    .header-content {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }
                    
                    .logo {
                        font-size: 2rem;
                        font-weight: bold;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                    }
                    
                    .company-n {
                        font-size: 1.5rem;
                        margin-left: 10px;
                    }
                    
                    /* Hero Section */
                    .hero {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 120px 0 80px;
                        text-align: center;
                    }
                    
                    .hero h1 {
                        font-size: 3rem;
                        margin-bottom: 1rem;
                        animation: fadeInUp 0.8s ease-out;
                    }
                    
                    .hero .subtitle {
                        font-size: 1.3rem;
                        margin-bottom: 2rem;
                        opacity: 0.9;
                        animation: fadeInUp 0.8s ease-out 0.2s;
                        animation-fill-mode: backwards;
                    }
                    
                    .cta-button {
                        display: inline-block;
                        padding: 15px 40px;
                        background: white;
                        color: #667eea;
                        text-decoration: none;
                        border-radius: 30px;
                        font-weight: bold;
                        font-size: 1.1rem;
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                        animation: fadeInUp 0.8s ease-out 0.4s;
                        animation-fill-mode: backwards;
                    }
                    
                    .cta-button:hover {
                        transform: translateY(-3px);
                        box-shadow: 0 10px 20px rgba(0,0,0,0.2);
                    }
                    
                    /* Features Section */
                    .features {
                        padding: 80px 0;
                        background: white;
                    }
                    
                    .features-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                        gap: 40px;
                        margin-top: 40px;
                    }
                    
                    .feature-card {
                        text-align: center;
                        padding: 30px;
                        border-radius: 10px;
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }
                    
                    .feature-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                    }
                    
                    .feature-icon {
                        font-size: 3rem;
                        margin-bottom: 20px;
                    }
                    
                    .feature-title {
                        font-size: 1.5rem;
                        margin-bottom: 15px;
                        color: #667eea;
                    }
                    
                    /* Stats Section */
                    .stats {
                        background: #f8f9fa;
                        padding: 60px 0;
                    }
                    
                    .stats-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 30px;
                        text-align: center;
                    }
                    
                    .stat-item {
                        padding: 20px;
                    }
                    
                    .stat-number {
                        font-size: 3rem;
                        font-weight: bold;
                        color: #667eea;
                        display: block;
                    }
                    
                    .stat-label {
                        font-size: 1.1rem;
                        color: #666;
                    }
                    
                    /* Testimonials */
                    .testimonials {
                        padding: 80px 0;
                        background: white;
                    }
                    
                    .testimonial-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 40px;
                        margin-top: 40px;
                    }
                    
                    .testimonial-card {
                        background: #f8f9fa;
                        padding: 30px;
                        border-radius: 10px;
                        position: relative;
                    }
                    
                    .testimonial-card::before {
                        content: """;
                        font-size: 4rem;
                        color: #667eea;
                        position: absolute;
                        top: -10px;
                        left: 20px;
                        opacity: 0.3;
                    }
                    
                    .quote {
                        font-style: italic;
                        margin-bottom: 20px;
                        color: #555;
                    }
                    
                    .author {
                        font-weight: bold;
                        color: #333;
                    }
                    
                    .position {
                        color: #666;
                        font-size: 0.9rem;
                    }
                    
                    /* Pricing Section */
                    .pricing {
                        padding: 80px 0;
                        background: #f8f9fa;
                    }
                    
                    .pricing-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                        gap: 30px;
                        margin-top: 40px;
                    }
                    
                    .pricing-card {
                        background: white;
                        border-radius: 10px;
                        padding: 40px;
                        text-align: center;
                        position: relative;
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }
                    
                    .pricing-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                    }
                    
                    .pricing-card.featured {
                        transform: scale(1.05);
                        border: 3px solid #667eea;
                    }
                    
                    .plan-n {
                        font-size: 1.8rem;
                        margin-bottom: 10px;
                        color: #333;
                    }
                    
                    .price {
                        font-size: 2.5rem;
                        font-weight: bold;
                        color: #667eea;
                        margin-bottom: 30px;
                    }
                    
                    .plan-features {
                        list-style: none;
                        margin-bottom: 30px;
                    }
                    
                    .plan-features item {
                        display: block;
                        padding: 10px 0;
                        color: #666;
                    }
                    
                    /* Footer */
                    footer {
                        background: #000;
                        color: white;
                        padding: 40px 0;
                        text-align: center;
                    }
                    
                    .footer-links {
                        display: flex;
                        justify-content: center;
                        gap: 30px;
                        margin-bottom: 20px;
                        flex-wrap: wrap;
                    }
                    
                    .footer-links link {
                        color: white;
                        text-decoration: none;
                        transition: color 0.3s ease;
                    }
                    
                    .footer-links link:hover {
                        color: #667eea;
                    }
                    
                    .social {
                        margin: 20px 0;
                    }
                    
                    .social platform {
                        margin: 0 15px;
                        color: #ccc;
                        cursor: pointer;
                        transition: color 0.3s ease;
                    }
                    
                    .social platform:hover {
                        color: #667eea;
                    }
                    
                    .section-title {
                        font-size: 2.5rem;
                        text-align: center;
                        margin-bottom: 20px;
                        color: #333;
                    }
                    
                    /* Animations */
                    @keyframes fadeInUp {
                        from {
                            opacity: 0;
                            transform: translateY(30px);
                        }
                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }
                    
                    /* Responsive */
                    @media (max-width: 768px) {
                        .hero h1 {
                            font-size: 2rem;
                        }
                        
                        .hero .subtitle {
                            font-size: 1.1rem;
                        }
                        
                        .features-grid,
                        .stats-grid,
                        .pricing-grid {
                            grid-template-columns: 1fr;
                        }
                        
                        .pricing-card.featured {
                            transform: scale(1);
                        }
                    }
                </style>
            </head>
            <body>
                <!-- Header -->
                <header>
                    <div class="container">
                        <div class="header-content">
                            <div style="display: flex; align-items: center;">
                                <span class="logo"><xsl:value-of select="landing-page/company/logo"/></span>
                                <span class="company-n"><xsl:value-of select="landing-page/company/n"/></span>
                            </div>
                            <nav>
                                <span style="color: #ccc;"><xsl:value-of select="landing-page/company/tagline"/></span>
                            </nav>
                        </div>
                    </div>
                </header>
                
                <!-- Hero Section -->
                <section class="hero">
                    <div class="container">
                        <h1><xsl:value-of select="landing-page/hero/title"/></h1>
                        <p class="subtitle"><xsl:value-of select="landing-page/hero/subtitle"/></p>
                        <a href="#{landing-page/hero/cta/action}" class="cta-button">
                            <xsl:value-of select="landing-page/hero/cta/text"/>
                        </a>
                    </div>
                </section>
                
                <!-- Features Section -->
                <section class="features">
                    <div class="container">
                        <h2 class="section-title">Why Choose QuantumFlow?</h2>
                        <div class="features-grid">
                            <xsl:for-each select="landing-page/features/feature">
                                <div class="feature-card">
                                    <div class="feature-icon"><xsl:value-of select="icon"/></div>
                                    <h3 class="feature-title"><xsl:value-of select="title"/></h3>
                                    <p><xsl:value-of select="description"/></p>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </section>
                
                <!-- Stats Section -->
                <section class="stats">
                    <div class="container">
                        <div class="stats-grid">
                            <xsl:for-each select="landing-page/stats/stat">
                                <div class="stat-item">
                                    <span class="stat-number"><xsl:value-of select="number"/></span>
                                    <span class="stat-label"><xsl:value-of select="label"/></span>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </section>
                
                <!-- Testimonials Section -->
                <section class="testimonials">
                    <div class="container">
                        <h2 class="section-title">What Our Clients Say</h2>
                        <div class="testimonial-grid">
                            <xsl:for-each select="landing-page/testimonials/testimonial">
                                <div class="testimonial-card">
                                    <p class="quote"><xsl:value-of select="quote"/></p>
                                    <div>
                                        <div class="author"><xsl:value-of select="author"/></div>
                                        <div class="position"><xsl:value-of select="position"/></div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </section>
                
                <!-- Pricing Section -->
                <section class="pricing">
                    <div class="container">
                        <h2 class="section-title">Choose Your Plan</h2>
                        <div class="pricing-grid">
                            <xsl:for-each select="landing-page/pricing/plan">
                                <div>
                                    <xsl:attribute name="class">
                                        pricing-card
                                        <xsl:if test="@featured='true'"> featured</xsl:if>
                                    </xsl:attribute>
                                    <h3 class="plan-n"><xsl:value-of select="n"/></h3>
                                    <div class="price"><xsl:value-of select="price"/></div>
                                    <div class="plan-features">
                                        <xsl:for-each select="features/item">
                                            <item><xsl:value-of select="."/></item>
                                        </xsl:for-each>
                                    </div>
                                    <a href="#signup" class="cta-button">Get Started</a>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </section>
                
                <!-- Footer -->
                <footer>
                    <div class="container">
                        <div class="footer-links">
                            <xsl:for-each select="landing-page/footer/links/link">
                                <link><xsl:value-of select="."/></link>
                            </xsl:for-each>
                        </div>
                        <div class="social">
                            <xsl:for-each select="landing-page/footer/social/platform">
                                <platform><xsl:value-of select="."/></platform>
                            </xsl:for-each>
                        </div>
                        <div><xsl:value-of select="landing-page/footer/copyright"/></div>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>