require('dotenv').config({ path: '.env.production' });

module.exports = {
  apps: [
    {
      name: 'frontend',
      script: 'docker-compose',
      args: 'up frontend',
      autorestart: true,
      watch: false,
      exec_mode: 'cluster',
      instances: process.env.INSTANCES || 2,
      max_memory_restart: process.env.MAX_MEMORY_RESTART || '500M',
      env: {
        NODE_ENV: process.env.NODE_ENV || 'production',
        FRONTEND_PORT: process.env.FRONTEND_PORT || 3000,
      },
    },
    {
      name: 'backend',
      script: 'docker-compose',
      args: 'up backend',
      autorestart: true,
      watch: false,
      exec_mode: 'cluster',
      instances: process.env.INSTANCES || 2,
      max_memory_restart: process.env.MAX_MEMORY_RESTART || '500M',
      env: {
        NODE_ENV: process.env.NODE_ENV || 'production',
      },
    },
    {
      name: 'db',
      script: 'docker-compose',
      args: 'up db',
      autorestart: true,
      watch: false,
      env: {
        NODE_ENV: process.env.NODE_ENV || 'production',
      },
    },
  ],

  deploy: {
    production: {
      user: process.env.DEPLOY_USER || 'default_user',
      host: process.env.DEPLOY_HOST || '127.0.0.1',
      ref: process.env.DEPLOY_REF || 'origin/main',
      repo: process.env.DEPLOY_REPO || 'git@github.com:username/project.git',
      path: process.env.DEPLOY_PATH || '/var/www/your_project',
      'post-deploy':
        'npm install && pm2 reload ecosystem.config.js --env production',
      env: {
        NODE_ENV: process.env.NODE_ENV || 'production',
      },
    },
  },
};
