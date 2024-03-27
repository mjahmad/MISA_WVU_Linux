#!/usr/bin/env python3
tasks = []

def show_tasks():
    for index, task in enumerate(tasks, start=1):
        print(f"{index}. {task}")

def add_task(task):
    tasks.append(task)
    print(f"Added task: {task}")

def remove_task(index):
    try:
        removed = tasks.pop(index-1)
        print(f"Removed task: {removed}")
    except IndexError:
        print("Task not found.")

# Simple CLI
while True:
    action = input("Choose an action: show, add, remove, exit: ")
    if action == "show":
        show_tasks()
    elif action == "add":
        task = input("Enter a task: ")
        add_task(task)
    elif action == "remove":
        index = int(input("Enter task number to remove: "))
        remove_task(index)
    elif action == "exit":
        break
    else:
        print("Unknown action.")
