#!/bin/bash

# Print commands for debugging
set -x

# Get the parent directory (project root)
PROJECT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
echo "Project root: $PROJECT_ROOT"

# Check if .env exists
if [ ! -f "$PROJECT_ROOT/.env" ]; then
  echo "Error: .env file not found at $PROJECT_ROOT/.env"
  exit 1
fi

# Load environment variables from .env in project root
source "$PROJECT_ROOT/.env"

# Check if required variables are set
if [ -z "$ATLASSIAN_USERNAME" ] || [ -z "$ATLASSIAN_TOKEN" ] || [ -z "$CONFLUENCE_URL" ] || [ -z "$JIRA_URL" ]; then
  echo "Error: Required environment variables are not set. Please check your .env file."
  exit 1
fi

# Run the MCP with appropriate parameters
uvx mcp-atlassian \
  --transport stdio \
  --confluence-url="$CONFLUENCE_URL" \
  --confluence-username="$ATLASSIAN_USERNAME" \
  --confluence-token="$ATLASSIAN_TOKEN" \
  --jira-url="$JIRA_URL" \
  --jira-username="$ATLASSIAN_USERNAME" \
  --jira-token="$ATLASSIAN_TOKEN" 
