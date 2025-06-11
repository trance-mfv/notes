---
author: li.aaron
contributors:
- li.aaron
published_at: '2025-01-07 09:42:21 +0700'
updated_at: '2025-05-18 20:39:31 +0700'
groups:
- mfg_all
---

# Accounting Plus - AI Development Workflow Onboarding

## Video Recording 
Previously, we had a sharing session at our Engineering All-hands meeting on utilizing AI during SDLC. The recording can be found [here](https://moneyforward.zoom.us/rec/share/RwVpOYazAc4GVn6JbdeABvmbzD1w-LKeZ-KrcumRMDC4DWhFyXAe-7be7vBxL2ps.9zuMbypXyyzUSgLI), and the password is  `*HM@8jDS`

## Essential Setup
### i.) Model Choice
Cursor's doc has this [model selection page](https://docs.cursor.com/guides/selecting-models). Highly recommend to check it out.

Among different models, the current gold standard is `claude-3.7-sonnet` for coding and technical tasks. This model offers the best balance of capability and reliability for our development needs.

If you are handling a complex task,  `claude-3.7-sonnet-thinking` or Google's `gemini-2.5-pro-preview-05-06` model is going to be helpful. However, since they are reasoning models, it takes more time for those models to output the response. As a result, for simple tasks, it's still recommended to use `claude-3.7-sonnet`

### ii.) IDE Choice
Money Forward provides two paid options:
- **Cursor** (recommended option, and this doc is based on Cursor usage)
- GitHub Copilot (if you want to use your IDE of choice, go for this one)

Both are company-sponsored. For Cursor access, join `#cursor_ai` on Slack.

### ii.) Privacy Mode
‼️ Always use the paid version and turn on the enforced privacy mode. It's not just about features—it's about keeping our code secure. **THIS IS VERY IMPORTANT!!!**

## Cursor Commands

Three core commands you'll use daily:

| Command | Name | Best For |
|---------|------|-----------|
| ⌘K (Ctrl + K) | Code Generation | • Inline code generation<br>• Quick code edits |
| ⌘L (Ctrl + L) | Chat | • Codebase questions<br>• Understanding code<br>• Problem-solving help |
| ⌘I (Ctrl + I) | Composer | • Writing new features<br>• Complex refactoring<br>• Direct file edits |

### When to Use What Command

| If You Want To... | Use | Why |
|------------------|-----|-----|
| Ask quick questions without code changes | ⌘L (Chat) | Keeps your code untouched while getting answers |
| Search or understand existing codebase | ⌘L (Chat) | Best for exploration and explanation |
| Build new features | ⌘I (Composer) | Generates files with new codes for you |
| Have AI directly refactor your code | ⌘I (Composer) | Provides dedicated workspace for complex changes |
| Generate new code with more control | ⌘K | Quick inline generation with your guidance |
| Make iterative code changes | ⌘K | Perfect for back-and-forth tweaking |


## Making AI Smarter: Context is king

### Setting Up Context

1. **Codebase Indexing**
   - Enable in Settings > Features
   - Powers accurate codebase-wide answers

<img title='image.png' alt='image' src='/attachments/b0f2b983-b143-4efa-a9a6-4fa061c1f4c6' width="720" data-meta='{"width":1950,"height":432}'>

2. **Document Indexing** 
   - Add document such as [Accounting Plus' support guide](https://biz.moneyforward.com/support/ac-plus/guide)
   - This allows you to easily reference it for queries such as the image below

<img title='image.png' alt='image' src='/attachments/e059ed97-5f82-4567-bc7c-8e4303efa406' width="720" data-meta='{"width":1843,"height":636}'>


3. **Custom Rules**
   - `.cursorrules` file
   - Settings > General > Rules for AI

An example `.cursorrules` used by an Cursor's engineer ([see here](https://x.com/kayladotdev/status/1853272891023872450))

<img title='image.png' alt='image' src='/attachments/a9f56d0e-47df-4d2f-b73f-287a460011ea' width="720" data-meta='{"width":720","height":800}'>


### Context Commands

## Context Commands for Better AI Responses

| Command | Scope | When to Use |
|---------|-------|-------------|
| `@codebase` | Entire Project | When you need AI to understand your full project context |
| `@folders` | Directory | When focusing on a specific feature or module |
| `@files` | Single File | When working with one file's implementation |
| `@code` | Code Snippet | When discussing specific functions or blocks |
| `@git` | Git History | When analyzing changes or commit history |
| `@web` | Web Content | When referencing external resources or docs |
| `@docs` | Documentation | When working with project documentation |

## Be Productive with Shortcuts

If you wanna see a demo, please check out the demo recording in [this slide](https://docs.google.com/presentation/d/1FenDRcNODBalztS5nFKThJwPT7Pm_vJmLyrK1x5m5BQ/edit?usp=sharing).

### Coding Related Tasks
| To Do This | Use This Command | Example Usage |
|---------------|------------------|---------------|
| Search Code | `@code_navigation.md` | <img title='image.png' alt='image' src='/attachments/d5982823-22d8-42db-b210-8e539b7f87f8' width="1682" data-meta='{"width":1682,"height":248}'> <br>*(Use `Cmd+Enter` to execute so that Cursor will do full codebase search)* |
| Generate PR Description | `@pr_generation.md` | <img title='image.png' alt='image' src='/attachments/56196d3d-75f3-483d-a81a-aa8fcd105694' width="1674" data-meta='{"width":1674,"height":244}'> |
| Review Code | `@code_review_general.md` | <img title='image.png' alt='image' src='/attachments/99b52085-6de0-41ff-995e-9c04e7d471c3' width="1652" data-meta='{"width":1652,"height":228}'>|
| Review Code | You can also use our Style Guide to review`@React Style Guide.md` | <img title='image.png' alt='image' src='/attachments/328c802f-830e-432e-b756-5666724cccd1' width="1668" data-meta='{"width":1668,"height":232}'> |

### Design Doc Related Tasks
| To Do This | Use This Command | Example Usage |
|---------------|------------------|---------------|
| Doc Review | `@doc_preview.md` | <img title='image.png' alt='image' src='/attachments/1c0e7719-4be6-4e2b-a2f6-a2a09752ab3e' width="1708" data-meta='{"width":1708,"height":184}'> |
| Doc Proofread | `@doc_proofread.md` | [Uploading image.png #4 ...]<img title='image.png' alt='image' src='/attachments/893c8552-a0e4-4e22-89b4-54b79239e369' width="1706" data-meta='{"width":1706,"height":180}'> |
| Doc Visualization | `@doc_visualization.md` | <img title='スクリーンショット 2025-01-20 18.13.11.png' alt='スクリーンショット 2025-01-20 18.13.11' src='/attachments/ba415c75-cab8-44c6-9cd2-8f26e1f3a11c' width="1700" data-meta='{"width":1700,"height":172}'>|


## Use AI IDE Beyond Coding
Cusor can do far more than just coding tasks. Cursor has evolved into a Swiss Army knife for knowledge workers. The advantage of using Cursor beyond coding tasks is that you can stay in one environment, maintaining your flow state **without constant context switching**. And with enforced privacy mode, your interactions remain private, never used to train AI models.

### Q&A Bot with RAG (Retrieval-Augmented Generation)
Cursor's built-in RAG capability turns any text file into a smart knowledge base. Open your documents or reference a url, and Cursor becomes your personal Q&A system, understanding and responding to questions about your content.

<img title='image.png' alt='image' src='/attachments/33e314e0-4abd-4c91-8ef1-f9374a2f0b87' width="720" data-meta='{"width":2474,"height":1008}'>

### Custom GPTs
Think of Cursor's Notepads as your personal GPT factory. Each Notepad can have its own personality and expertise through custom prompts. Whether you need a writing assistant or a translator – it's all possible without leaving your IDE. (See [this article on how to use Notepads](https://docs.cursor.com/features/beta/notepads#notepads))

<img title='image.png' alt='image' src='/attachments/38bd001c-c4bd-4e16-9be1-6b1702553cd5' width="720" data-meta='{"width":1146,"height":346}'>

### Integrated Web Search
Need information from the web? Use `@Web`, and Cursor will search, crawl, and summarize the answers for you. It's like having Perplexity built right into your IDE.

<img title='image.png' alt='image' src='/attachments/83799bbc-7c01-48d2-ad22-36cbf3004f71' width="720" data-meta='{"width":1682,"height":918}'>
