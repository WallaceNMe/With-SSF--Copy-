#!/bin/sh
set -e
npx medusa db:migrate
npm run seed # Changed from npx medusa seed
npx medusa develop