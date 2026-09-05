# Restaurant Discovery

A lightweight SwiftUI sample app for browsing restaurant data from a bundled JSON file.

## Overview

The project demonstrates a simple native iOS data flow:

- Decode local JSON into Swift models
- Display restaurants in a scrollable list
- Sort restaurants by rating
- Navigate to a restaurant detail view
- Mark and unmark favorites for the current app session
- Handle loading and error states

## Tech

- Swift
- SwiftUI
- iOS 17+
- async/await
- Codable
- Native Apple frameworks only

## Data

Sample restaurant data is stored in `restaurants.json` and bundled with the app.

Each restaurant contains:

- Name
- Cuisine
- Rating
- Delivery time
- Delivery fee
- Description

## Project Structure

```text
RestaurantDiscovery/
├── Models/
├── Services/
├── ViewModels/
├── Resources/
├── ContentView.swift
└── RestaurantDiscoveryApp.swift
```

## Planned Functionality

- Restaurant list
- Rating-based sorting
- Detail navigation
- Session-based favorites
- Loading and failure states

## Notes

This repository is intentionally lightweight and uses no third-party dependencies.
