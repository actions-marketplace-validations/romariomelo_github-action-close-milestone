# Close Milestone Action

This GitHub Action allows you to close a milestone with the given title.

## Inputs

- **title** (required): The title of the milestone to be closed.

## Outputs

- **number**: The number of the recently closed milestone.

## Example Usage

```yaml
name: Close Milestone

on:
  push:
    branches:
      - main

jobs:
  close-milestone:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout do repositório
        uses: actions/checkout@v2

      - name: close milestone
        id: close_milestone
        uses: romariomelo/github-action-close-milestone@v1
        with:
          title: 'v1.0'

      - name: Message
        run: echo "The closed milestone is number ${{ steps.close_milestone.outputs.number }}"
```
