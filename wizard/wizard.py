#!/usr/bin/env python3
"""
OpenCode Setup Wizard 2.0
Interactive setup for AI-powered development teams
"""

import json
import os
import sys
from pathlib import Path
from typing import Dict, List, Any
import questionary
from questionary import Style

# Custom style
custom_style = Style([
    ('qmark', 'fg:#673ab7 bold'),
    ('question', 'bold'),
    ('answer', 'fg:#f44336 bold'),
    ('pointer', 'fg:#673ab7 bold'),
    ('highlighted', 'fg:#673ab7 bold'),
    ('selected', 'fg:#cc5454'),
    ('separator', 'fg:#cc5454'),
    ('instruction', ''),
    ('text', ''),
])

class ProjectWizard:
    def __init__(self):
        self.config: Dict[str, Any] = {}
        self.agents: List[str] = []
        self.plan: List[Dict] = []
        
    def run(self):
        """Run the complete wizard"""
        print("\n🚀 OpenCode Setup Wizard 2.0\n")
        print("Ti guiderò nella creazione del tuo team di sviluppo AI\n")
        
        # Fase 1: Discovery
        self._discovery_phase()
        
        # Fase 2: Analysis & Suggestions
        self._analysis_phase()
        
        # Fase 3: Generation
        self._generation_phase()
        
        # Fase 4: Kickoff
        self._kickoff_phase()
        
    def _discovery_phase(self):
        """Phase 1: Gather project requirements"""
        print("\n📋 Fase 1: Discovery\n")
        
        # Project type
        self.config['project_type'] = questionary.select(
            "Che tipo di progetto vuoi creare?",
            choices=[
                "Web Application (SaaS)",
                "E-commerce",
                "Mobile App",
                "API Backend",
                "CLI Tool",
                "Desktop App",
                "AI/ML Application",
                "Marketplace",
                "Social Network",
                "Dashboard/Analytics"
            ],
            style=custom_style
        ).ask()
        
        # Project name
        self.config['project_name'] = questionary.text(
            "Qual è il nome del progetto?",
            validate=lambda text: len(text) > 0 or "Il nome è obbligatorio"
        ).ask()
        
        # Project description
        self.config['description'] = questionary.text(
            "Descrivi brevemente il tuo progetto (1-2 frasi):",
            validate=lambda text: len(text) > 10 or "Descrivi meglio il progetto"
        ).ask()
        
        # Target users
        self.config['target_users'] = questionary.text(
            "Chi sono i tuoi utenti target?",
            validate=lambda text: len(text) > 0 or "Specifica gli utenti target"
        ).ask()
        
        # Main problem
        self.config['main_problem'] = questionary.text(
            "Quale problema principale risolve il tuo progetto?",
            validate=lambda text: len(text) > 0 or "Specifica il problema"
        ).ask()
        
        # Features (multi-select)
        all_features = self._get_features_for_type(self.config['project_type'])
        self.config['features'] = questionary.checkbox(
            "Quali feature sono essenziali per la MVP?",
            choices=[{"name": f} for f in all_features],
            style=custom_style
        ).ask()
        
        # Tech preferences
        self.config['tech_preference'] = questionary.select(
            "Hai preferenze tecnologiche?",
            choices=[
                "Suggerisci tu lo stack ottimale",
                "JavaScript/TypeScript (React, Next.js, Node.js)",
                "Python (FastAPI, Django, Flask)",
                "Go (Gin, Echo, Fiber)",
                "Rust (Actix, Axum)",
                "Java (Spring Boot)",
                "PHP (Laravel)",
                "Mobile (React Native, Flutter)",
                "Custom (specifica dopo)"
            ],
            style=custom_style
        ).ask()
        
        # Budget
        self.config['budget'] = questionary.select(
            "Qual è il tuo budget mensile per il deploy?",
            choices=[
                "$0-50 (Free tier, hobby)",
                "$50-100 (Startup, piccolo progetto)",
                "$100-300 (Business, medio progetto)",
                "$300-1000 (Enterprise, grande progetto)",
                "$1000+ (Enterprise, scaling)"
            ],
            style=custom_style
        ).ask()
        
        # Timeline
        self.config['timeline'] = questionary.select(
            "Quando vorresti lanciare la MVP?",
            choices=[
                "2-4 settimane (MVP minimale)",
                "1-2 mesi (MVP completa)",
                "3-6 mesi (Prodotto completo)",
                "6+ mesi (Prodotto enterprise)"
            ],
            style=custom_style
        ).ask()
        
        # Team size
        self.config['team_size'] = questionary.select(
            "Quante persone lavoreranno al progetto?",
            choices=[
                "Solo io (solo developer)",
                "2-3 persone (piccolo team)",
                "4-10 persone (team medio)",
                "10+ persone (grande team)"
            ],
            style=custom_style
        ).ask()
        
    def _analysis_phase(self):
        """Phase 2: Analyze and suggest optimal stack"""
        print("\n🔍 Fase 2: Analisi e Suggerimenti\n")
        
        # Load suggestions database
        suggestions = self._load_suggestions()
        
        # Determine optimal stack
        self.config['recommended_stack'] = self._determine_stack(suggestions)
        
        # Determine required agents
        self.config['required_agents'] = self._determine_agents()
        
        # Estimate costs
        self.config['estimated_costs'] = self._estimate_costs()
        
        # Estimate timeline
        self.config['estimated_timeline'] = self._estimate_timeline()
        
        # Show recommendations
        print("\n✨ Analisi completata!\n")
        print("📊 Raccomandazioni:")
        print(f"   Stack: {self.config['recommended_stack']['frontend']} + {self.config['recommended_stack']['backend']}")
        print(f"   Database: {self.config['recommended_stack']['database']}")
        print(f"   Deploy: {self.config['recommended_stack']['deploy']}")
        print(f"   Costo stimato: {self.config['estimated_costs']}")
        print(f"   Tempo MVP: {self.config['estimated_timeline']}")
        
        # Confirm or adjust
        confirm = questionary.confirm(
            "Sei soddisfatto delle raccomandazioni?",
            default=True
        ).ask()
        
        if not confirm:
            self._manual_adjustments()
    
    def _generation_phase(self):
        """Phase 3: Generate all files"""
        print("\n⚙️  Fase 3: Generazione File\n")
        
        # Create project directory
        project_dir = Path(self.config['project_name'].lower().replace(' ', '-'))
        project_dir.mkdir(exist_ok=True)
        
        # Generate orchestrator
        self._generate_orchestrator(project_dir)
        print("   ✅ .opencode/orchestrator.md")
        
        # Generate agents
        self._generate_agents(project_dir)
        for agent in self.config['required_agents']:
            print(f"   ✅ .opencode/agents/{agent}.md")
        
        # Generate CLAUDE.md
        self._generate_claude_md(project_dir)
        print("   ✅ CLAUDE.md")
        
        # Generate development plan
        self._generate_plan(project_dir)
        print("   ✅ PLAN.md")
        
        # Generate .env.example
        self._generate_env_example(project_dir)
        print("   ✅ .env.example")
        
        # Generate README
        self._generate_readme(project_dir)
        print("   ✅ README.md")
        
        print(f"\n📁 Progetto creato in: {project_dir.absolute()}")
    
    def _kickoff_phase(self):
        """Phase 4: Offer to start first task"""
        print("\n🎯 Fase 4: Kickoff\n")
        
        start = questionary.confirm(
            "Vuoi lanciare il primo task adesso?",
            default=True
        ).ask()
        
        if start:
            self._show_first_tasks()
        else:
            print("\n📝 Prossimi step:")
            print(f"   1. cd {self.config['project_name'].lower().replace(' ', '-')}")
            print("   2. Leggi PLAN.md per la roadmap completa")
            print("   3. Inizia con il primo task")
            print("   4. Usa 'Voglio implementare X' per lanciare gli agenti")
    
    def _get_features_for_type(self, project_type: str) -> List[str]:
        """Get relevant features based on project type"""
        base_features = [
            "Autenticazione utenti (email/password)",
            "Login social (Google, Apple, Facebook)",
            "Dashboard utente",
            "Profilo utente",
            "Notifiche (email/push)",
            "Sistema pagamenti",
            "Admin panel",
            "Analytics e statistiche",
            "Ricerca e filtri",
            "Upload file/immagini",
            "Esportazione dati (PDF/CSV)",
            "API pubblica",
            "Documentazione API",
            "Test automatizzati",
            "CI/CD pipeline"
        ]
        
        type_features = {
            "E-commerce": [
                "Catalogo prodotti",
                "Carrello acquisti",
                "Checkout e pagamenti",
                "Gestione ordini",
                "Recensioni prodotti",
                "Wishlist",
                "Coupon e sconti",
                "Gestione inventario"
            ],
            "Social Network": [
                "Feed attività",
                "Sistema follow/ami",
                "Post e commenti",
                "Like e reazioni",
                "Messaggistica privata",
                "Notifiche real-time",
                "Condivisione contenuti",
                "Gruppi e community"
            ],
            "Marketplace": [
                "Profili venditori",
                "Catalogo multi-vendor",
                "Sistema commissioni",
                "Gestione ordini",
                "Recensioni venditori",
                "Chat venditore-acquirente",
                "Gestione spedizioni",
                "Sistema dispute"
            ],
            "Dashboard/Analytics": [
                "Grafici e visualizzazioni",
                "Report personalizzati",
                "Esportazione dati",
                "Dashboard real-time",
                "Alert e notifiche",
                "Filtri avanzati",
                "Condivisione report",
                "Integrazione dati esterni"
            ]
        }
        
        features = base_features.copy()
        if project_type in type_features:
            features.extend(type_features[project_type])
        
        return sorted(set(features))
    
    def _load_suggestions(self) -> Dict:
        """Load suggestions database"""
        suggestions_file = Path(__file__).parent / "suggestions" / "stack_suggestions.json"
        if suggestions_file.exists():
            with open(suggestions_file) as f:
                return json.load(f)
        return {}
    
    def _determine_stack(self, suggestions: Dict) -> Dict:
        """Determine optimal stack based on project"""
        project_type = self.config['project_type']
        tech_pref = self.config['tech_preference']
        
        # Default stacks by project type
        stacks = {
            "Web Application (SaaS)": {
                "frontend": "Next.js 14 + TypeScript",
                "backend": "Next.js API Routes + tRPC",
                "database": "PostgreSQL + Prisma",
                "deploy": "Vercel + Railway",
                "auth": "NextAuth.js",
                "payments": "Stripe"
            },
            "E-commerce": {
                "frontend": "Next.js 14 + TypeScript",
                "backend": "Next.js API Routes",
                "database": "PostgreSQL + Prisma",
                "deploy": "Vercel + Railway",
                "auth": "NextAuth.js",
                "payments": "Stripe"
            },
            "Mobile App": {
                "frontend": "React Native + Expo",
                "backend": "Node.js + Express",
                "database": "PostgreSQL + Prisma",
                "deploy": "Railway + Expo",
                "auth": "Expo Auth",
                "payments": "RevenueCat"
            },
            "API Backend": {
                "frontend": "N/A",
                "backend": "FastAPI + Python",
                "database": "PostgreSQL + SQLAlchemy",
                "deploy": "Railway",
                "auth": "JWT + OAuth2",
                "payments": "N/A"
            },
            "AI/ML Application": {
                "frontend": "Next.js + TypeScript",
                "backend": "FastAPI + Python",
                "database": "PostgreSQL + pgvector",
                "deploy": "Railway + Modal",
                "auth": "NextAuth.js",
                "payments": "Stripe"
            }
        }
        
        # Override with user preference
        if tech_pref != "Suggerisci tu lo stack ottimale":
            if "JavaScript" in tech_pref:
                stacks[project_type]["backend"] = "Node.js + Express"
            elif "Python" in tech_pref:
                stacks[project_type]["backend"] = "FastAPI + Python"
            elif "Go" in tech_pref:
                stacks[project_type]["backend"] = "Go + Gin"
            elif "Rust" in tech_pref:
                stacks[project_type]["backend"] = "Rust + Actix-web"
        
        return stacks.get(project_type, stacks["Web Application (SaaS)"])
    
    def _determine_agents(self) -> List[str]:
        """Determine required agents based on project"""
        agents = ["frontend", "backend", "database", "qa-engineer", "devops"]
        
        project_type = self.config['project_type']
        features = self.config['features']
        
        # Add specialized agents based on project
        if "Mobile" in project_type:
            agents.append("mobile")
        
        if any("AI" in f or "ML" in f for f in features):
            agents.append("ai-engineer")
        
        if any("pagamento" in f.lower() for f in features):
            agents.append("payments")
        
        return agents
    
    def _estimate_costs(self) -> str:
        """Estimate monthly costs"""
        budget = self.config['budget']
        
        if "$0-50" in budget:
            return "$20-50/mese (free tiers)"
        elif "$50-100" in budget:
            return "$50-100/mese"
        elif "$100-300" in budget:
            return "$100-300/mese"
        else:
            return "$300+/mese"
    
    def _estimate_timeline(self) -> str:
        """Estimate development timeline"""
        features = self.config['features']
        timeline = self.config['timeline']
        
        # Base timeline on number of features
        num_features = len(features)
        
        if num_features < 5:
            return "2-3 settimane"
        elif num_features < 10:
            return "1-2 mesi"
        elif num_features < 15:
            return "2-3 mesi"
        else:
            return "3-6 mesi"
    
    def _manual_adjustments(self):
        """Allow manual adjustments to recommendations"""
        print("\n🔧 Modifica manuale\n")
        
        # Adjust frontend
        self.config['recommended_stack']['frontend'] = questionary.text(
            "Frontend framework:",
            default=self.config['recommended_stack']['frontend']
        ).ask()
        
        # Adjust backend
        self.config['recommended_stack']['backend'] = questionary.text(
            "Backend framework:",
            default=self.config['recommended_stack']['backend']
        ).ask()
        
        # Adjust database
        self.config['recommended_stack']['database'] = questionary.text(
            "Database:",
            default=self.config['recommended_stack']['database']
        ).ask()
    
    def _generate_orchestrator(self, project_dir: Path):
        """Generate orchestrator.md"""
        opencode_dir = project_dir / ".opencode"
        opencode_dir.mkdir(exist_ok=True)
        
        content = f"""# Orchestrator - {self.config['project_name']}

## Ruolo
Sei l'orchestratore del progetto {self.config['project_name']}. 
{self.config['description']}

## Stack Tecnologico
- **Frontend**: {self.config['recommended_stack']['frontend']}
- **Backend**: {self.config['recommended_stack']['backend']}
- **Database**: {self.config['recommended_stack']['database']}
- **Deploy**: {self.config['recommended_stack']['deploy']}
- **Auth**: {self.config['recommended_stack']['auth']}

## Agenti Disponibili
{chr(10).join([f"- @{agent}" for agent in self.config['required_agents']])}

## Processo
1. Analizza richiesta utente
2. Identifica agenti necessari
3. Delega task in parallelo
4. Integra risultati
5. Verifica con build/test

## Regole
- Task indipendenti → parallelo
- Task dipendenti → sequenza
- Stesso file → mai due agenti
- Sempre build/test finale
"""
        
        with open(opencode_dir / "orchestrator.md", "w") as f:
            f.write(content)
    
    def _generate_agents(self, project_dir: Path):
        """Generate agent files"""
        agents_dir = project_dir / ".opencode" / "agents"
        agents_dir.mkdir(exist_ok=True)
        
        for agent in self.config['required_agents']:
            content = self._get_agent_template(agent)
            with open(agents_dir / f"{agent}.md", "w") as f:
                f.write(content)
    
    def _get_agent_template(self, agent: str) -> str:
        """Get template for specific agent"""
        templates = {
            "frontend": f"""# Frontend Developer Agent

## Ruolo
Sei uno sviluppatore frontend specializzato in {self.config['recommended_stack']['frontend']}.

## Stack
- {self.config['recommended_stack']['frontend']}
- TypeScript strict mode
- Tailwind CSS
- State management

## Responsabilità
- Componenti UI riutilizzabili
- Pagine responsive
- Integrazione API
- Ottimizzazione performance

## Convenzioni
- TypeScript strict
- Componenti functional
- Tailwind per stili
- Test coverage 80%+
""",
            "backend": f"""# Backend Developer Agent

## Ruolo
Sei uno sviluppatore backend specializzato in {self.config['recommended_stack']['backend']}.

## Stack
- {self.config['recommended_stack']['backend']}
- {self.config['recommended_stack']['database']}
- {self.config['recommended_stack']['auth']}

## Responsabilità
- API endpoints
- Logica business
- Autenticazione
- Validazione dati

## Convenzioni
- Type-safe
- Error handling
- Input validation
- Test coverage 80%+
""",
            "database": f"""# Database Engineer Agent

## Ruolo
Sei un ingegnere del database specializzato in {self.config['recommended_stack']['database']}.

## Stack
- {self.config['recommended_stack']['database']}
- Migrations
- Query optimization

## Responsabilità
- Schema design
- Migrations
- Query optimization
- Data integrity

## Convenzioni
- Normalization
- Indexes su campi query
- Foreign keys
- Soft delete dove appropriato
""",
            "qa-engineer": """# QA Engineer Agent

## Ruolo
Sei un ingegnere QA specializzato in testing automatico.

## Stack
- Unit testing (Vitest/Jest/pytest)
- E2E testing (Playwright/Cypress)
- API testing

## Responsabilità
- Test unit
- Test integration
- Test E2E
- Coverage reporting

## Convenzioni
- AAA pattern (Arrange-Act-Assert)
- Test isolation
- Coverage 80%+
- Fast tests (<100ms unit)
""",
            "devops": f"""# DevOps Engineer Agent

## Ruolo
Sei un ingegnere DevOps specializzato in deploy e CI/CD.

## Stack
- {self.config['recommended_stack']['deploy']}
- Docker
- GitHub Actions
- Monitoring

## Responsabilità
- Deploy configuration
- CI/CD pipeline
- Environment management
- Monitoring setup

## Convenzioni
- Infrastructure as Code
- Immutable deployments
- Health checks
- Auto-scaling
""",
            "mobile": """# Mobile Developer Agent

## Ruolo
Sei uno sviluppatore mobile specializzato in React Native.

## Stack
- React Native + Expo
- TypeScript
- React Navigation
- State management

## Responsabilità
- Componenti mobile
- Navigazione
- API integration
- Native modules

## Convenzioni
- Functional components
- StyleSheet
- Platform-specific code
- Performance optimization
""",
            "ai-engineer": """# AI Engineer Agent

## Ruolo
Sei un ingegnere AI specializzato in machine learning.

## Stack
- Python + FastAPI
- PyTorch/TensorFlow
- scikit-learn
- Hugging Face

## Responsabilità
- Model training
- API inference
- Data preprocessing
- Model optimization

## Convenzioni
- Type hints
- Error handling
- Model versioning
- A/B testing
"""
        }
        
        return templates.get(agent, f"# {agent.title()} Agent\n\n## Ruolo\nSpecialista in {agent}.\n")
    
    def _generate_claude_md(self, project_dir: Path):
        """Generate CLAUDE.md"""
        content = f"""# {self.config['project_name']}

## Panoramica
{self.config['description']}

**Target**: {self.config['target_users']}
**Problema**: {self.config['main_problem']}

## Stack Tecnologico
- **Frontend**: {self.config['recommended_stack']['frontend']}
- **Backend**: {self.config['recommended_stack']['backend']}
- **Database**: {self.config['recommended_stack']['database']}
- **Deploy**: {self.config['recommended_stack']['deploy']}
- **Auth**: {self.config['recommended_stack']['auth']}

## Feature MVP
{chr(10).join([f"- {feature}" for feature in self.config['features']])}

## Struttura Directory
```
{self.config['project_name'].lower().replace(' ', '-')}/
├── .opencode/
│   ├── orchestrator.md
│   └── agents/
├── src/
├── public/
├── tests/
├── CLAUDE.md
├── PLAN.md
└── README.md
```

## Comandi Utili
```bash
npm install          # Install dependencies
npm run dev          # Start dev server
npm run build        # Build for production
npm run test         # Run tests
```

## Variabili d'Ambiente
Vedi `.env.example` per tutte le variabili necessarie.

## Convenzioni
- TypeScript strict mode
- ESLint + Prettier
- Commit convenzionali
- Test coverage 80%+
- Code review obbligatorio
"""
        
        with open(project_dir / "CLAUDE.md", "w") as f:
            f.write(content)
    
    def _generate_plan(self, project_dir: Path):
        """Generate development plan"""
        phases = self._create_development_phases()
        
        content = f"""# Piano di Sviluppo - {self.config['project_name']}

## Timeline: {self.config['estimated_timeline']}
## Budget: {self.config['estimated_costs']}

## Fasi di Sviluppo

"""
        
        for i, phase in enumerate(phases, 1):
            content += f"### Fase {i}: {phase['name']}\n\n"
            content += f"**Durata**: {phase['duration']}\n\n"
            content += "**Task**:\n"
            for task in phase['tasks']:
                content += f"- [ ] {task}\n"
            content += "\n"
        
        content += """## Metriche di Successo

- [ ] Tutti i task completati
- [ ] Test coverage > 80%
- [ ] Build senza errori
- [ ] Deploy riuscito
- [ ] Documentazione completa

## Prossimi Step

1. Inizia con Fase 1
2. Completa tutti i task prima di procedere
3. Testa ogni feature prima di integrare
4. Deploy in staging prima di produzione
"""
        
        with open(project_dir / "PLAN.md", "w") as f:
            f.write(content)
    
    def _create_development_phases(self) -> List[Dict]:
        """Create development phases based on features"""
        phases = [
            {
                "name": "Setup & Infrastructure",
                "duration": "2-3 giorni",
                "tasks": [
                    "Setup progetto con framework scelto",
                    "Configurazione database",
                    "Setup autenticazione",
                    "Configurazione deploy",
                    "Setup CI/CD pipeline"
                ]
            },
            {
                "name": "Core Features",
                "duration": "1-2 settimane",
                "tasks": [f"Implementare {feature}" for feature in self.config['features'][:5]]
            },
            {
                "name": "Advanced Features",
                "duration": "1-2 settimane",
                "tasks": [f"Implementare {feature}" for feature in self.config['features'][5:10]]
            },
            {
                "name": "Polish & Testing",
                "duration": "3-5 giorni",
                "tasks": [
                    "Test E2E completi",
                    "Ottimizzazione performance",
                    "Security audit",
                    "Documentazione API",
                    "User acceptance testing"
                ]
            },
            {
                "name": "Launch",
                "duration": "1-2 giorni",
                "tasks": [
                    "Deploy produzione",
                    "Monitoring setup",
                    "Annuncio lancio",
                    "Feedback collection"
                ]
            }
        ]
        
        return phases
    
    def _generate_env_example(self, project_dir: Path):
        """Generate .env.example"""
        content = f"""# Database
DATABASE_URL="postgresql://user:password@localhost:5432/{self.config['project_name'].lower().replace(' ', '_')}"

# Authentication
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-secret-key-here"

# OAuth Providers (optional)
GOOGLE_CLIENT_ID=""
GOOGLE_CLIENT_SECRET=""
GITHUB_CLIENT_ID=""
GITHUB_CLIENT_SECRET=""

# Payments (if needed)
STRIPE_SECRET_KEY=""
STRIPE_PUBLISHABLE_KEY=""
STRIPE_WEBHOOK_SECRET=""

# Email (optional)
RESEND_API_KEY=""

# Storage (optional)
UPLOADTHING_SECRET=""
UPLOADTHING_APP_ID=""

# Analytics (optional)
POSTHOG_KEY=""

# App
NEXT_PUBLIC_APP_URL="http://localhost:3000"
NEXT_PUBLIC_APP_NAME="{self.config['project_name']}"
"""
        
        with open(project_dir / ".env.example", "w") as f:
            f.write(content)
    
    def _generate_readme(self, project_dir: Path):
        """Generate README.md"""
        content = f"""# {self.config['project_name']}

{self.config['description']}

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- PostgreSQL 15+
- npm o yarn

### Installation

```bash
# Clone repository
git clone <your-repo-url>
cd {self.config['project_name'].lower().replace(' ', '-')}

# Install dependencies
npm install

# Setup environment
cp .env.example .env
# Edit .env with your values

# Setup database
npx prisma migrate dev

# Start development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

## 📋 Features

{chr(10).join([f"- {feature}" for feature in self.config['features']])}

## 🛠️ Tech Stack

- **Frontend**: {self.config['recommended_stack']['frontend']}
- **Backend**: {self.config['recommended_stack']['backend']}
- **Database**: {self.config['recommended_stack']['database']}
- **Deploy**: {self.config['recommended_stack']['deploy']}

## 🤖 AI Development Team

Questo progetto usa OpenCode Agents per lo sviluppo parallelo:

{chr(10).join([f"- @{agent}" for agent in self.config['required_agents']])}

### Usage

```bash
# Example: Implement a new feature
"Voglio implementare il sistema di notifiche"

# The orchestrator will:
# 1. Analyze the request
# 2. Call necessary agents in parallel
# 3. Integrate results
# 4. Verify with build/test
```

See `PLAN.md` for the complete development roadmap.

## 📚 Documentation

- [CLAUDE.md](./CLAUDE.md) - Project context for AI
- [PLAN.md](./PLAN.md) - Development plan
- [.opencode/orchestrator.md](./.opencode/orchestrator.md) - AI orchestration rules

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- Built with [OpenCode Agents](https://github.com/yourusername/opencode-agents)
- Powered by AI-driven development
"""
        
        with open(project_dir / "README.md", "w") as f:
            f.write(content)
    
    def _show_first_tasks(self):
        """Show first tasks to execute"""
        print("\n🎯 Primi task da eseguire:\n")
        
        print("1️⃣  Setup progetto:")
        print(f"   cd {self.config['project_name'].lower().replace(' ', '-')}")
        print("   npm install")
        print("   cp .env.example .env")
        print("   # Configura .env con i tuoi valori")
        
        print("\n2️⃣  Primo task con AI:")
        print('   "Setup progetto completo con database e autenticazione"')
        
        print("\n3️⃣  Secondo task:")
        print('   "Implementa la pagina dashboard con statistiche"')
        
        print("\n💡 Suggerimento:")
        print("   Leggi PLAN.md per la roadmap completa")
        print("   Usa prompt specifici per risultati migliori")


def main():
    """Main entry point"""
    try:
        wizard = ProjectWizard()
        wizard.run()
    except KeyboardInterrupt:
        print("\n\n❌ Setup annullato dall'utente")
        sys.exit(1)
    except Exception as e:
        print(f"\n\n❌ Errore: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
