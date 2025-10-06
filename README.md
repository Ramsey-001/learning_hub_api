
🧠 LearningHub API

A Ruby on Rails 8 JSON API that powers a simple blogging platform.
It supports user authentication with JWT (JSON Web Tokens), post creation, comments, and internationalization (i18n).



🚀 Features

🔐 User Authentication with JWT (Login, Signup, Token Authorization)

📝 CRUD for Posts (Create, Read, Delete)

💬 Comments System (User-based)

🌍 Multi-language Support (i18n)

⚙️ CORS-Enabled API for frontends like Vue.js

🧾 Structured JSON Responses for easy frontend integration




🧱 Tech Stack

Backend: Ruby on Rails 8

Database: PostgreSQL

Authentication: JWT (via devise-jwt)

Serialization: ActiveModel Serializer

Frontend Example: Vue.js (can be any JS frontend)



🧩 Installation

1️⃣ Clone the repository

git clone https://github.com/your-username/learninghub-api.git
cd learninghub-api

2️⃣ Install dependencies

bundle install

3️⃣ Setup the database

rails db:create db:migrate db:seed

4️⃣ Run the server

rails server

Your API will start at
➡️ http://localhost:3000




🔑 Authentication Flow

1. Sign Up

Endpoint: POST /signup

Body Example:

{
  "user": {
    "email": "user@example.com",
    "password": "password"
  }
}



2. Login

Endpoint: POST /login

Body Example:

{
  "user": {
    "email": "user@example.com",
    "password": "password"
  }
}

Response includes a JWT Token in headers:

Authorization: Bearer <your_jwt_token>



3. Use JWT Token

For protected routes (e.g., /posts, /comments), include this header:

Authorization: Bearer <token>




🧠 API Endpoints

👤 Users

Method	Endpoint	Description

POST	/signup	Register a new user
POST	/login	Log in and get JWT token




📝 Posts

Method	Endpoint	Description	Auth Required

GET	/posts	List all posts	❌
GET	/posts/:id	Get a single post with comments	❌
POST	/posts	Create a new post	✅
DELETE	/posts/:id	Delete user’s post	✅


Post JSON Example:

{
  "post": {
    "title": "My First Post",
    "content": "Hello world!"
  }
}



💬 Comments

Method	Endpoint	Description	Auth Required

POST	/posts/:post_id/comments	Add a comment to a post	✅


Comment JSON Example:

{
  "comment": {
    "content": "Nice article!"
  }
}



⚙️ Configuration

JWT Secret

Set your secret key in environment variables:

export DEVISE_JWT_SECRET_KEY="your_secret_key"

Or store it in Rails credentials:

rails credentials:edit

CORS

Allow frontend requests from http://localhost:5173 (for Vue):
Edit config/initializers/cors.rb:

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'
    resource '*',
      headers: :any,
      expose: ['Authorization'],
      methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end



🧪 Testing API

You can test with:

🧰 Postman

🦋 Insomnia

🌐 cURL


Example:

curl -X POST http://localhost:3000/posts \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{"post": {"title": "Post Title", "content": "Post Content"}}'



📦 Project Structure

learninghub-api/
├── app/
│   ├── controllers/
│   │   ├── posts_controller.rb
│   │   ├── comments_controller.rb
│   │   ├── users/
│   │   │   ├── registrations_controller.rb
│   │   │   ├── sessions_controller.rb
│   ├── models/
│   │   ├── post.rb
│   │   ├── comment.rb
│   │   ├── user.rb
│   ├── serializers/
│   │   ├── post_serializer.rb
│   │   ├── comment_serializer.rb
│   ├── services/
│   │   ├── json_web_token.rb
├── config/
│   ├── routes.rb
│   ├── initializers/
│   │   ├── devise.rb
│   │   ├── cors.rb
│   │   ├── jwt.rb
│   ├── application.rb
├── Gemfile
└── README.md



🧩 Example Frontend Integration (Vue.js)

const token = localStorage.getItem('token');

axios.post('http://localhost:3000/posts', 
  { post: { title: 'Hello', content: 'World' }},
  { headers: { Authorization: `Bearer ${token}` }}
)
.then(response => console.log(response.data))
.catch(error => console.log(error.response.data));



🧑‍💻 Author

Awwal Yusuf
Backend Engineer | Ruby on Rails Developer




