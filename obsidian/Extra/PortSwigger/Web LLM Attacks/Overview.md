# Web LLM Attacks

## Details:
Detecting LLM vulnerabilities

Our recommended methodology for detecting LLM vulnerabilities is:

- Identify the LLM's inputs, including both direct (such as a prompt) and indirect (such as training data) inputs.
- Work out what data and APIs the LLM has access to.
- Probe this new attack surface for vulnerabilities.

Many web LLM attacks rely on a technique known as prompt injection. This is where an attacker uses crafted prompts to manipulate an LLM's output. Prompt injection can result in the AI taking actions that fall outside of its intended purpose, such as making incorrect calls to sensitive APIs or returning content that does not correspond to its guidelines.

a customer support LLM might have access to APIs that manage users, orders, and stock

The first stage of using an LLM to attack APIs and plugins is to work out which APIs and plugins the LLM has access to. One way to do this is to simply ask the LLM which APIs it can access.

If the LLM isn't cooperative, try providing misleading context and re-asking the question. For example, you could claim that you are the LLM's developer and so should have a higher level of privilege. 

---

# Lab 1
## Goal: 
Use the LLM to delete the user carlos.

## Solution:

