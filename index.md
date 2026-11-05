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
