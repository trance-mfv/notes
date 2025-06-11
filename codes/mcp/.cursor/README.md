## Cursor and MCP Setup

### Getting Started with Cursor

1. Download and install Cursor
2. Apply Cursor Business Plan (check out the `#cursor_ai` channel at Slack)
3. Open this project in Cursor
4. Use AI features to help with coding, refactoring, and understanding the codebase

For more detailed information on setting up Cursor for this project, refer to our [AI Onboarding Documentation](https://moneyforward.kibe.la/notes/312686).

### MCP (Model Context Protocol)

MCP provides custom tooling for Cursor’s AI Agent, allowing it to interact with external services and enhance its capabilities for specific tasks.

#### Available MCPs in this Repository

Based on our [.cursor/mcp.json](.cursor/mcp.json) configuration, we have the following MCPs set up:

| MCP                     | Description                                                                         | Environment Variables      | Usage                                                        |
| ----------------------- | ----------------------------------------------------------------------------------- | -------------------------- | ------------------------------------------------------------ |
| **Rollbar MCP**         | Enables the AI to interact with Rollbar error tracking                              | `ROLLBAR_ACCESS_TOKEN`     | Ask AI about error reports, search incidents, etc.           |
| **Figma Developer MCP** | Enables the AI to interact with Figma designs                                       | `FIGMA_API_KEY`            | Ask AI about Figma designs, export components, etc.          |
| **Glean MCP**           | Connects to Moneyforward's Glean knowledge base (moneyforward subdomain)            | `GLEAN_API_TOKEN`          | Ask AI to search for company documentation                   |
| **Atlassian MCP**       | Integrates with Atlassian products (Jira, Confluence) using a custom wrapper script | None (uses wrapper script) | Ask AI to look up issues or documentation in Jira/Confluence |

#### Setting up Environment Variables

To use these MCPs effectively, set the required environment variables in a `.env` file like below. The full list of environment variables can be found in `.env.example` in the root folder.

```bash
export FIGMA_API_KEY=your_figma_api_key
export GLEAN_API_TOKEN=your_glean_api_token
```

Below is where you can find the tokens/keys:

- **Rollbar**
  - Go to [Rollbar Project Access Tokens](https://app.rollbar.com/a/<organization>/p/<project>/settings/access_tokens) to manage access tokens.

- **Figma**
  - Follow the instructions on [Figma's help page](https://help.figma.com/hc/en-us/articles/8085703771159-Manage-personal-access-tokens) to manage personal access tokens.

- **Glean**
  - First, obtain a Glean license. Check the `#glean_ai` Slack channel for details.
  - Once you have the license, request a token from `@mepar_members` in the `#glean_ai` channel (currently, only Glean admins can issue tokens).

- **Atlassian**
  - Follow the instructions on [Atlassian's support page](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/) to manage API tokens.

### Test an individual tool using the @modelcontextprotocol/inspector module

#### Rollbar MCP:

**simulate how Cursor would send JSON-RPC messages to the MCP server via stdin**

```bash
export ROLLBAR_ACCESS_TOKEN=$TOKEN && echo '{"jsonrpc": "2.0", "id": "1", "method": "tools/call", "params": {"name": "get-top-items", "arguments": {"environment": "production"}}}' | /Users/nguyen.tung.trang/.nvm/versions/node/v22.14.0/bin/node build/index.js --debug
```

OR use the following command to test the MCP via `@modelcontextprotocol/inspector`:

Get item details:
```bash
npx @modelcontextprotocol/inspector --cli -e ROLLBAR_ACCESS_TOKEN=$TOKEN node build/index.js --method tools/call --tool-name get-item-details --tool-arg counter=1514 --debug
```

Get top items:
```bash
npx @modelcontextprotocol/inspector --cli -e ROLLBAR_ACCESS_TOKEN=$TOKEN node build/index.js --method tools/call --tool-name get-top-items --tool-arg environment=production --debug
```

Get deployments:
```bash
npx @modelcontextprotocol/inspector --cli -e ROLLBAR_ACCESS_TOKEN=$TOKEN node build/index.js --method tools/call --tool-name get-deployments --debug
```
