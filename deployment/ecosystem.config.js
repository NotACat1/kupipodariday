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
        NODE_ENV: process.env.NODE_ENV,
        FRONTEND_PORT: process.env.FRONTEND_PORT || 3000,
      },
      env_production: {
        NODE_ENV: 'production',
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
        NODE_ENV: process.env.NODE_ENV,
      },
      env_production: {
        NODE_ENV: 'production',
      },
    },
    {
      name: 'db',
      script: 'docker-compose',
      args: 'up db',
      autorestart: true,
      watch: false,
      env: {
        NODE_ENV: process.env.NODE_ENV,
      },
      env_production: {
        NODE_ENV: 'production',
      },
    },
  ],

  deploy: {
    production: {
      user: process.env.DEPLOY_USER,
      host: process.env.DEPLOY_HOST,
      ref: process.env.DEPLOY_REF,
      repo: process.env.DEPLOY_REPO,
      path: process.env.DEPLOY_PATH,
      'post-deploy':
        'npm install && pm2 reload ./deployment/ecosystem.config.js --env production',
      env: {
        NODE_ENV: 'production',
      },
    },
  },
};
