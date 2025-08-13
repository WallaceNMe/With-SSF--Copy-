ADDITIONAL FILES REQUIRED

You will need to create the following files:
A. Backend:
    1. .env
    2. .env.template
B. Storefront:
    1. .env.local

-----------------------
.env:

MEDUSA_ADMIN_ONBOARDING_TYPE=nextjs
STORE_CORS=http://localhost:8000,https://docs.medusajs.com
ADMIN_CORS=http://localhost:7000,http://localhost:9000,https://docs.medusajs.com
AUTH_CORS=http://localhost:7000,http://localhost:9000,http://localhost:8000,https://docs.medusajs.com
REDIS_URL=redis://cache:6379
JWT_SECRET=supersecret
COOKIE_SECRET=supersecret
DATABASE_URL=postgres://postgres:postgres@postgres:5432/medusa-docker
MEDUSA_ADMIN_ONBOARDING_NEXTJS_DIRECTORY=storefront
EVENTS_REDIS_URL=redis://cache

-----------------------
.env.template:

STORE_CORS=http://localhost:8000 #,https://docs.medusajs.com
ADMIN_CORS=http://localhost:5173,http://localhost:9000,https://docs.medusajs.com
AUTH_CORS=http://localhost:5173,http://localhost:9000,https://docs.medusajs.com
REDIS_URL=redis://localhost:6379
JWT_SECRET=supersecret
COOKIE_SECRET=supersecret
DATABASE_URL=
DB_NAME=medusa-v2
POSTGRES_URL=

-----------------------
.env.local:
MEDUSA_BACKEND_URL=http://medusa-server:9000
NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY=pk_86a1a284e4e1e963414df2de5e747baa84358c7689284cd88b37e667224487a4
NEXT_PUBLIC_BASE_URL=http://backend:8000
NEXT_PUBLIC_DEFAULT_REGION=us
REVALIDATE_SECRET=supersecret

- You will have to change this PUBLISHABLE_KEY value to be specific to your web. See the below
-----------------------
CONFIGURATION
1. The first time you docker compose up --build, check backend/develop.sh and comment/uncomment the seed line. The point being that you only want this line running once or you run into errors.
2. After running, exec into your backend container, which I believe has been named medusa-server. Do this with "docker exec -it medusa-server sh"
3. Then, create an Admin User with "npx medusa user -e testuser@thisdoesntmatter.com -p fakepassword" The values don't matter, but they will let you into the Admin Dashboard at localhost:9000.
4. Go to the Admin Dashboard at localhost:9000 and login with your new account. On the sidebar, navigate to Settings >> Publishable API Keys. If you've run the seed command already, there may be an API Key already there. I haven't tried using that key, but it might work, try it if you want. Alternatively, Click the button to add a new key, name it, and then create a sales channel for it. Then click the button to copy the API key. It looks something like pk_86a***38b. That copies it to your clipboard. Then, navigate to storefront/.env.local and set that copied key as the value of NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY.
