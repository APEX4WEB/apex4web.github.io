#!/bin/zsh

# Script to set up Jekyll Portfolio for GitHub Pages with Sage Green theme
# Target Repository: apex4web.github.io

set -e

echo "🟢 Creating project directory structure..."
mkdir -p _data _layouts assets/css

echo "📄 Creating _config.yml..."
cat << 'EOF' > _config.yml
title: Portfolio & Executive Profile
description: Technology Strategy, Enterprise IT Operations & Digital Transformation
url: "https://apex4web.github.io"
baseurl: ""

# Jekyll settings
markdown: kramdown
theme: minima

# Build settings
plugins:
  - jekyll-seo-tag
  - jekyll-sitemap
EOF

echo "🎨 Creating assets/css/main.scss..."
cat << 'EOF' > assets/css/main.scss
---
---

// Sage Green Design Tokens
:root {
  --bg-primary: #F5F7F5;
  --bg-card: #FFFFFF;
  --text-main: #2C3531;
  --text-muted: #5E6D64;
  --sage-primary: #588157;
  --sage-hover: #3A5A40;
  --sage-light: #E4EBE5;
  --sage-accent: #A3B18A;
  --border-color: #D3DDD6;
  --shadow-sm: 0 2px 8px rgba(44, 53, 49, 0.05);
  --shadow-md: 0 4px 16px rgba(44, 53, 49, 0.08);
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  background-color: var(--bg-primary);
  color: var(--text-main);
  line-height: 1.6;
  padding: 0;
  margin: 0;
}

.container {
  max-width: 960px;
  margin: 0 auto;
  padding: 2.5rem 1.5rem;
}

// Header & Navigation
header.site-header {
  background: var(--bg-card);
  border-bottom: 1px solid var(--border-color);
  padding: 1.25rem 0;
  position: sticky;
  top: 0;
  z-index: 100;
  
  .header-inner {
    max-width: 960px;
    margin: 0 auto;
    padding: 0 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .logo {
    font-weight: 700;
    font-size: 1.25rem;
    color: var(--sage-hover);
    text-decoration: none;
    letter-spacing: -0.02em;
  }

  nav a {
    color: var(--text-muted);
    text-decoration: none;
    margin-left: 1.5rem;
    font-weight: 500;
    transition: color 0.2s ease;

    &:hover {
      color: var(--sage-primary);
    }
  }
}

// Hero Section
.hero {
  background: var(--bg-card);
  border: 1px solid var(--border-color);
  border-radius: 12px;
  padding: 2.5rem;
  margin-bottom: 2rem;
  box-shadow: var(--shadow-sm);

  .tag {
    display: inline-block;
    background: var(--sage-light);
    color: var(--sage-hover);
    font-size: 0.85rem;
    font-weight: 600;
    padding: 0.25rem 0.75rem;
    border-radius: 20px;
    margin-bottom: 1rem;
  }

  h1 {
    font-size: 2.25rem;
    line-height: 1.2;
    color: var(--text-main);
    margin-bottom: 0.75rem;
  }

  p.subtitle {
    font-size: 1.15rem;
    color: var(--text-muted);
    margin-bottom: 1.5rem;
    max-width: 720px;
  }

  .badge-list {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    
    .badge {
      background: var(--bg-primary);
      border: 1px solid var(--border-color);
      color: var(--text-main);
      padding: 0.35rem 0.85rem;
      border-radius: 6px;
      font-size: 0.85rem;
      font-weight: 500;
    }
  }
}

// Section Blocks
.section-block {
  margin-bottom: 2.5rem;

  h2 {
    font-size: 1.5rem;
    color: var(--sage-hover);
    margin-bottom: 1.25rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;

    &::after {
      content: "";
      flex: 1;
      height: 1px;
      background: var(--border-color);
    }
  }
}

// Experience & Project Cards
.card-grid {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
}

.item-card {
  background: var(--bg-card);
  border: 1px solid var(--border-color);
  border-radius: 10px;
  padding: 1.5rem;
  box-shadow: var(--shadow-sm);
  transition: transform 0.2s ease, box-shadow 0.2s ease;

  &:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
    border-color: var(--sage-accent);
  }

  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 0.5rem;

    h3 {
      font-size: 1.15rem;
      color: var(--text-main);
    }

    .period {
      font-size: 0.85rem;
      color: var(--text-muted);
      font-weight: 500;
      white-space: nowrap;
    }
  }

  .role-subtitle {
    font-size: 0.95rem;
    color: var(--sage-primary);
    font-weight: 600;
    margin-bottom: 0.75rem;
  }

  ul {
    padding-left: 1.2rem;
    color: var(--text-muted);
    font-size: 0.95rem;

    li {
      margin-bottom: 0.4rem;
    }
  }
}

// Footer
footer {
  border-top: 1px solid var(--border-color);
  padding: 2rem 0;
  text-align: center;
  color: var(--text-muted);
  font-size: 0.9rem;
  margin-top: 3rem;
}
EOF

echo "📐 Creating _layouts/default.html..."
cat << 'EOF' > _layouts/default.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ page.title | default: site.title }}</title>
  <link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
</head>
<body>

  <header class="site-header">
    <div class="header-inner">
      <a href="{{ '/' | relative_url }}" class="logo">Apex Portfolio</a>
      <nav>
        <a href="#about">About</a>
        <a href="#experience">Experience</a>
        <a href="#projects">Projects</a>
      </nav>
    </div>
  </header>

  <main class="container">
    {{ content }}
  </main>

  <footer>
    <div class="container">
      <p>&copy; {{ 'now' | date: "%Y" }} • Built with Jekyll & GitHub Pages</p>
    </div>
  </footer>

</body>
</html>
EOF

echo "📊 Creating _data/experience.yml..."
cat << 'EOF' > _data/experience.yml
roles:
  - title: "IT Operations & Technology Strategy Lead"
    company: "Financial Analytics & Credit Risk Solutions"
    period: "2020 - Present"
    highlights:
      - "Led enterprise IT infrastructure transformation and DevOps automation across multi-platform hybrid environments."
      - "Engineered scalable cloud and containerized strategies leveraging Kubernetes, Docker, and CI/CD pipelines."
      - "Optimized operational efficiency and process alignment utilizing Six Sigma methodologies."

  - title: "Enterprise Systems Administrator & DevOps Specialist"
    company: "Technology Services"
    period: "2016 - 2020"
    highlights:
      - "Managed enterprise Active Directory, domain services, certificate management, and cross-platform infrastructure."
      - "Implemented automated deployment systems and server orchestration workflows."

projects:
  - name: "China Cloud & DGX Delivery Strategy"
    category: "Enterprise Strategy & Cloud Architecture"
    description: "Formulated a strategic market entry and compliance framework for high-performance cloud compute and AI service models."
    tags: ["Cloud Strategy", "Governance", "Enterprise Tech"]

  - name: "NYC Spatial Data & Analytics Model"
    category: "Data Science & Spatial Modeling"
    description: "Built an R-based spatial analytics framework utilizing Open Data to model urban foot-traffic density, profitability, and regulatory risk."
    tags: ["RStudio", "Spatial Analytics", "sf / ggplot2"]

  - name: "Containerized Microservices Cluster"
    category: "DevOps & Infrastructure"
    description: "Deployed edge server environments with K3s, Docker Compose, and Git-driven configuration pipelines."
    tags: ["Kubernetes", "Docker", "Linux"]
EOF

echo "📝 Creating index.md..."
cat << 'EOF' > index.md
---
layout: default
title: Home | Technology Strategy & Portfolio
---

<div class="hero" id="about">
  <span class="tag">MBA Candidate • HKU Business School</span>
  <h1>IT Operations, Strategy & Cloud Architecture</h1>
  <p class="subtitle">
    Combining 11+ years of enterprise IT infrastructure experience with business transformation strategy, cloud deployment models, and spatial data analytics.
  </p>
  <div class="badge-list">
    <span class="badge">DevOps & Cloud</span>
    <span class="badge">IT Strategy</span>
    <span class="badge">Six Sigma Green Belt</span>
    <span class="badge">R & Spatial Data Analytics</span>
    <span class="badge">Kubernetes & Linux</span>
  </div>
</div>

<section class="section-block" id="experience">
  <h2>Professional Experience</h2>
  <div class="card-grid">
    {% for role in site.data.experience.roles %}
    <div class="item-card">
      <div class="card-header">
        <h3>{{ role.company }}</h3>
        <span class="period">{{ role.period }}</span>
      </div>
      <div class="role-subtitle">{{ role.title }}</div>
      <ul>
        {% for item in role.highlights %}
        <li>{{ item }}</li>
        {% endfor %}
      </ul>
    </div>
    {% endfor %}
  </div>
</section>

<section class="section-block" id="projects">
  <h2>Featured Strategy & Analytics Projects</h2>
  <div class="card-grid">
    {% for project in site.data.experience.projects %}
    <div class="item-card">
      <div class="card-header">
        <h3>{{ project.name }}</h3>
        <span class="period">{{ project.category }}</span>
      </div>
      <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 0.75rem;">
        {{ project.description }}
      </p>
      <div class="badge-list">
        {% for tag in project.tags %}
        <span class="badge" style="background: var(--sage-light); color: var(--sage-hover); border: none;">{{ tag }}</span>
        {% endfor %}
      </div>
    </div>
    {% endfor %}
  </div>
</section>
EOF

echo "📄 Creating README.md..."
cat << 'EOF' > README.md
# APEX4WEB Portfolio

Jekyll-based portfolio site hosted on GitHub Pages with a custom Sage Green theme.

## Local Setup

1. Install Jekyll and dependencies:
   ```bash
   bundle install

