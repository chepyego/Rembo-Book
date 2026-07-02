# README

live demo - rembobook.com

# Remboook

Remboook is a multi-tenant SaaS application built with Ruby on Rails 8 that enables salon owners to manage their services and appointments through their own dedicated workspace. Each salon receives a unique subdomain where clients can browse services and book appointments online.

## Features

- Multi-tenant architecture with tenant-specific subdomains
- Salon owner authentication
- Service management
- Online appointment booking
- Booking management dashboard
- Responsive UI built with Hotwire and Tailwind CSS

## Tech Stack

- Ruby on Rails 8
- PostgreSQL
- Hotwire (Turbo & Stimulus)
- Tailwind CSS
- Docker
- Kamal
- Hetzner Cloud

## Deployment

The application is containerized with Docker and deployed to a Hetzner Cloud server using Kamal, demonstrating modern Rails deployment practices.

Requirements

Ruby 3.2+

Rails 8

SQLite or MySQL

## How to get started:

- clone the repo

- bundle install to install all the system gems

- run all the migrations

- run bin/dev to start the server in development mode

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
