# mercor-interview-docker
# 🐳 Mercor Docker Assessment

This repository contains a custom `Dockerfile` that sets up a conda-based environment to test the `attrs` library at a specific commit. It is part of a technical assignment for a Python Software Engineer position.

---

## 📦 What’s Inside?

- **Base Image**: Ubuntu 22.04
- **Python**: 3.7 (via Miniconda)
- **Tools**: `pytest`, `hypothesis`, `attrs==19.3.0`
- **Tests**: Automatically run tests from `tests/test_funcs.py` using `pytest`

---

## 🛠️ How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/mercor-docker-assessment.git
cd mercor-docker-assessment
