
## 10 unique Ruby on Rails gems you should be aware of
https://medium.com/codex/10-unique-ruby-on-rails-gems-you-should-be-aware-of-e8423d18f8a0

## Trailblazer gem
- [Trailblazer](https://github.com/trailblazer/trailblazer): to structure business logic

## Install MCP

### MySQL
- [mcp-server-mysql](https://github.com/benborla/mcp-server-mysql)

```bash
# Using Smithery
npx -y @smithery/cli@latest install @benborla29/mcp-server-mysql

# Run MCP server
npx mcprunner MYSQL_HOST=127.0.0.1 MYSQL_PORT=3306 MYSQL_USER=nguyen.tung.trang MYSQL_PASS=Qw3r MYSQL_DB=tax_adjustment_web ALLOW_INSERT_OPERATION=true ALLOW_UPDATE_OPERATION=true ALLOW_DELETE_OPERATION=false -- npx -y @benborla29/mcp-server-mysql
```

