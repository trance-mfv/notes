# Integrating LINE Login into a Rails Application

To integrate LINE Login into your Rails app, follow these steps:

## 1. LINE Developers Account and Channel Setup

- **Create a LINE Developers account:**  
    Sign up at [LINE Developers](https://developers.line.biz/).
- **Create a LINE Login channel:**  
    In your account, create a new LINE Login channel to obtain your Channel ID and Channel Secret.
- **Configure Callback URL:**  
    Set the callback URL in your channel settings. This should be the endpoint in your Rails app where LINE redirects users after authorization.

## 2. Gem Installation and Configuration

- **Add gems to your Gemfile:**
    ```ruby
    gem 'line-login'
    gem 'omniauth'
    gem 'omniauth-line'
    ```
- **Install gems:**
    ```sh
    bundle install
    ```
- **Configure OmniAuth:**  
    In `config/initializers/omniauth.rb`:
    ```ruby
    Rails.application.config.middleware.use OmniAuth::Builder do
        provider :line, ENV['LINE_CHANNEL_ID'], ENV['LINE_CHANNEL_SECRET']
    end
    ```
- **Set environment variables:**  
    Ensure `LINE_CHANNEL_ID` and `LINE_CHANNEL_SECRET` are set (e.g., in your `.env` file).

## 3. Implementing LINE Login

- **Routes:**  
    Define routes for LINE Login (e.g., `/auth/line` and `/auth/line/callback`).
- **Controller actions:**  
    Example:
    ```ruby
    class UsersController < ApplicationController
        def auth_line
            redirect_to "/auth/line"
        end

        def auth_line_callback
            auth = request.env["omniauth.auth"]
            # Handle authentication response
            # Access user info: auth.info.name, auth.info.image, etc.
            # Create/find user in DB and log them in
        end
    end
    ```
- **View:**  
    Example login button:
    ```erb
    <%= link_to "Login with LINE", users_auth_line_path %>
    ```

## 4. Handling Authentication and Authorization

- **Access user info:**  
    Use `auth.info` for profile data.
- **Create or find user:**  
    Use `auth.uid` (LINE user ID) to identify users.
- **Sign in user:**  
    Use `sign_in(user)` (e.g., with Devise).
- **Error handling:**  
    Implement error handling for authentication failures.
