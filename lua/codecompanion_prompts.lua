-- Custom prompts for CodeCompanion
return {
  ['Direct Code Helper'] = {
    strategy = 'chat',
    description = 'Direct coding help without reasoning',
    opts = {
      index = 1,
      default_prompt = true,
    },
    prompts = {
      {
        role = 'system',
        content = [[You are a concise coding assistant. Provide direct answers without explaining your reasoning process. 

Rules:
- Give practical, working solutions
- Skip the "let me think about this" or reasoning explanations  
- Be clear and concise
- Focus on the code and immediate next steps
- Only explain complex concepts when specifically asked]],
      },
    },
  },

  ['Quick Fix'] = {
    strategy = 'inline',
    description = 'Quick code fixes',
    prompts = {
      {
        role = 'system',
        content = 'Fix the code issue directly. Provide only the corrected code without explanations unless critical.',
      },
      {
        role = 'user',
        content = 'Fix this code: {{selected_text}}',
      },
    },
  },
}
