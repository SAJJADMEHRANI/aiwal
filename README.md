# AIWAL - Laravel Dashboard Application

AIWAL is a Laravel-based dashboard application featuring an RTL design for Persian/Farsi language support.

## Features

- RTL layout optimized for Persian/Farsi
- User authentication and profile management
- Company management features
- Responsive design
- Theme customization with multiple color options
- Dark/light mode support

## Tech Stack

- Laravel 11
- PHP 8.2
- MySQL 8.0
- TailwindCSS
- Alpine.js
- Vite

## Prerequisites

- Docker and Docker Compose

## Quick Start with Docker

1. Clone the repository:
   ```
   git clone https://github.com/SAJJADMEHRANI/aiwal.git
   cd aiwal
   ```

2. Copy the example environment file:
   ```
   cp .env.example .env
   ```

3. Start the Docker containers:
   ```
   docker-compose up -d
   ```

4. Install PHP dependencies:
   ```
   docker-compose exec app composer install
   ```

5. Generate application key:
   ```
   docker-compose exec app php artisan key:generate
   ```

6. Run database migrations:
   ```
   docker-compose exec app php artisan migrate
   ```

7. Install NPM dependencies and build assets:
   ```
   docker-compose run npm install
   docker-compose run npm run build
   ```

8. Access the application at http://localhost:8000

## Manual Setup (without Docker)

### Requirements

- PHP >= 8.2
- Composer
- Node.js & NPM
- MySQL >= 8.0

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/SAJJADMEHRANI/aiwal.git
   cd aiwal
   ```

2. Install PHP dependencies:
   ```
   composer install
   ```

3. Copy environment file and configure database:
   ```
   cp .env.example .env
   ```

4. Generate application key:
   ```
   php artisan key:generate
   ```

5. Run database migrations:
   ```
   php artisan migrate
   ```

6. Install NPM dependencies and build assets:
   ```
   npm install
   npm run build
   ```

7. Start the development server:
   ```
   php artisan serve
   ```

## Configuration

### Environment Variables

Update the `.env` file with your specific configuration:

- `APP_NAME`: Application name
- `APP_URL`: URL where the application is hosted
- `DB_CONNECTION`, `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`: Database configuration

## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).