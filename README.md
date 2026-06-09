# OpenCode Agents 2.0 🚀

**Sistema AI-powered per sviluppo software parallelo con wizard interattivo**

Crea team di agenti AI specializzati per il tuo progetto in meno di 5 minuti. Il wizard analizza le tue esigenze e genera automaticamente orchestratore, agenti personalizzati e piano di sviluppo completo.

## ✨ Novità 2.0

- 🎯 **Wizard Interattivo** - Rispondi a domande intelligenti, ottieni setup completo
- 🤖 **AI Suggestions** - Suggerimenti stack basati sul tuo progetto
- 📋 **Auto Plan Generator** - Piano di sviluppo dettagliato automatico
- 🔧 **Dynamic Templates** - Agenti generati su misura per il tuo stack
- ⚡ **Quick Start** - Da zero a codice in 5 minuti

## 🚀 Quick Start

### Come Funziona

Non c'è nulla da installare! Il sistema funziona direttamente nella chat con l'AI.

**1. Dimmi cosa vuoi creare**

Esempio:
```
"Voglio creare un SaaS per gestione clienti"
"Voglio un e-commerce per prodotti artigianali"
"Voglio un'app per tracciare abitudini"
```

**2. Io ti guido passo passo**

Ti farò domande semplici (una alla volta):
- Tipo di progetto
- Nome e descrizione
- Target utenti
- Feature principali (ti suggerisco io quelle migliori)
- Preferenze tecniche
- Budget e timeline

**3. Genero tutto automaticamente**

Dopo le domande, creo automaticamente:
- `.opencode/orchestrator.md` - Regole orchestrazione
- `.opencode/agents/*.md` - Agenti specializzati per il tuo progetto
- `CLAUDE.md` - Contesto progetto
- `PLAN.md` - Piano di sviluppo dettagliato
- `.env.example` - Variabili ambiente
- `README.md` - Documentazione

**4. Inizi subito a sviluppare**

Mi dici "Iniziamo con la Fase 1" e io chiamo gli agenti necessari in parallelo!

## 🎯 Esempio Completo

**Tu:** "Voglio creare un SaaS per gestione clienti freelance"

**AI:** Ti fa 7 domande semplici (una alla volta)

**Dopo le risposte, l'AI genera:**

```
✨ Analisi completata!

📊 Raccomandazioni:
   Stack: Next.js 14 + TypeScript + PostgreSQL + Prisma
   Deploy: Vercel + Railway
   Costo stimato: $70/mese
   Tempo MVP: 6 settimane

🤖 Agenti generati:
   - @frontend (Next.js specialist)
   - @backend (API + tRPC)
   - @database (PostgreSQL + Prisma)
   - @qa-engineer (Vitest + Playwright)
   - @devops (Vercel + Railway)

📁 File creati:
   ✅ .opencode/orchestrator.md
   ✅ .opencode/agents/*.md (5 agenti)
   ✅ CLAUDE.md
   ✅ PLAN.md
   ✅ .env.example
   ✅ README.md
```

## 📊 Stack Supportati

### JavaScript/TypeScript
- **Next.js 14** - Full-stack React framework
- **React + Vite** - SPA moderne
- **Vue.js + Nuxt** - Progressive framework
- **Node.js + Express** - Backend API
- **tRPC** - End-to-end type safety

### Python
- **FastAPI** - API moderne ad alte prestazioni
- **Django** - Full-stack web framework
- **Flask** - Microframework

### Go
- **Gin/Echo/Fiber** - Web frameworks
- **gRPC** - Microservices

### Rust
- **Actix-web/Axum** - Web frameworks

### Mobile
- **React Native + Expo** - Cross-platform mobile
- **Flutter** - Cross-platform UI

### Database
- **PostgreSQL** - Relazionale avanzato
- **MySQL/MariaDB** - Relazionale classico
- **MongoDB** - NoSQL document
- **Redis** - Cache e sessioni

### Deploy
- **Vercel** - Frontend, serverless
- **Railway** - Full-stack
- **Fly.io** - App deployment
- **AWS/GCP/Azure** - Enterprise

## 🎨 Come Funziona

### 1. Discovery Phase
Tu mi dici cosa vuoi creare e io ti faccio domande intelligenti:
- Tipo di applicazione
- Feature essenziali
- Target utenti
- Vincoli tecnici e budget

### 2. Analysis Phase
Analizzo le tue risposte e suggerisco:
- Stack tecnologico ottimale
- Architettura consigliata
- Agenti necessari
- Stima costi e tempi

### 3. Generation Phase
Genero automaticamente:
- Orchestratore personalizzato
- Agenti specializzati
- Piano di sviluppo dettagliato
- Documentazione completa

### 4. Kickoff Phase
Ti aiuto a iniziare:
- Setup progetto
- Primo task con AI
- Best practices

## 📋 Piano di Sviluppo Automatico

Il wizard genera un piano dettagliato con:

```markdown
## Fase 1: Setup & Infrastructure (2-3 giorni)
- [ ] Setup progetto Next.js + TypeScript
- [ ] Database schema con Prisma
- [ ] Autenticazione con NextAuth
- [ ] Deploy config su Vercel

## Fase 2: Core Features (1-2 settimane)
- [ ] Dashboard utente
- [ ] Tracker abitudini
- [ ] Statistiche e grafici
- [ ] Notifiche push

## Fase 3: Advanced Features (1-2 settimane)
- [ ] AI recommendations
- [ ] Social features
- [ ] Gamification
- [ ] Export dati

## Fase 4: Polish & Launch (3-5 giorni)
- [ ] Test E2E
- [ ] Performance optimization
- [ ] Security audit
- [ ] Deploy produzione
```

## 🤖 Agenti Specializzati

### Base Agents (sempre inclusi)
- **@frontend** - UI/UX, componenti, pagine
- **@backend** - API, logica business, auth
- **@database** - Schema, migrations, query
- **@qa-engineer** - Test unit, E2E, integration
- **@devops** - Deploy, CI/CD, monitoring

### Specialized Agents (opzionali)
- **@ai-engineer** - Modelli ML, recommendations
- **@mobile** - React Native, Flutter
- **@payments** - Stripe, PayPal integration
- **@security** - Audit, penetration testing
- **@websocket** - Real-time features

## 💡 Esempi di Utilizzo

### Esempio 1: SaaS App
**Tu:** "Voglio creare un SaaS per gestione progetti con team collaboration"

**AI genera:**
- Next.js + TypeScript + PostgreSQL
- 5 agenti specializzati
- Piano 6 settimane

### Esempio 2: E-commerce
```bash
$ python3 wizard/wizard.py
? Tipo progetto: E-commerce
? Nome: ArtisanMarket
? Feature: Catalog, Cart, Checkout, Reviews, Vendor dashboard
? Stack: Suggerisci tu
? Budget: $100-200

# Genera:
# - Next.js + Stripe + PostgreSQL
# - 6 agenti (incluso @payments)
# - Piano 8 settimane
```

### Esempio 3: Mobile App
```bash
$ python3 wizard/wizard.py
? Tipo progetto: Mobile App
? Nome: FitnessTracker
? Feature: Workout tracking, Progress charts, Social, Notifications
? Stack: Suggerisci tu
? Budget: $50-150

# Genera:
# - React Native + Expo + Node.js
# - 6 agenti (incluso @mobile)
# - Piano 10 settimane
```

## 🔧 Personalizzazione

### Modifica Agenti
Dopo la generazione, puoi personalizzare gli agenti:

```bash
# Modifica agente frontend
nano .opencode/agents/frontend.md

# Aggiungi nuovo agente
nano .opencode/agents/security.md
```

### Aggiungi Stack Custom
Se il tuo stack non è supportato:

1. Modifica `suggestions/stack_suggestions.json`
2. Aggiungi il tuo stack
3. Rilancia il wizard

### Template Custom
Crea template personalizzati in `templates/`:

```markdown
# Custom Agent Template

## Ruolo
Sei uno specialista in [TECHNOLOGY].

## Stack
- [STACK_DETAILS]

## Responsabilità
- [RESPONSIBILITIES]
```

## 📊 Confronto 1.0 vs 2.0

| Feature | 1.0 | 2.0 |
|---------|-----|-----|
| Setup | Manuale (15-30 min) | Wizard (5 min) |
| Personalizzazione | Post-setup | Durante setup |
| Suggerimenti | Nessuno | AI-powered |
| Piano sviluppo | Manuale | Automatico |
| Agenti | Generici | Su misura |
| Stack supportati | 8 | 20+ |
| Learning curve | Media | Bassa |

## 🎓 Best Practices

### 1. Sii Specifico nelle Risposte
❌ "Voglio un'app"
✅ "Voglio un SaaS per gestione progetti con team collaboration"

### 2. Prioritizza le Feature
Seleziona solo le feature essenziali per la MVP. Puoi aggiungere il resto dopo.

### 3. Scegli Budget Realistico
- **$0-50**: Hobby/side project
- **$50-100**: Startup/MVP
- **$100-300**: Business/prodotto completo
- **$300+**: Enterprise/scaling

### 4. Timeline Realistica
- **2-4 settimane**: MVP minimale (3-5 feature)
- **1-2 mesi**: MVP completa (5-10 feature)
- **3-6 mesi**: Prodotto completo (10-20 feature)

### 5. Testa Subito
Dopo la generazione, lancia il primo task:
```
"Setup progetto completo con database e autenticazione"
```

## 🚨 Troubleshooting

### Python non trovato
```bash
# macOS
brew install python

# Ubuntu/Debian
sudo apt-get install python3 python3-pip

# Windows
# Scarica da python.org
```

### Dependencies error
```bash
# Aggiorna pip
pip3 install --upgrade pip

# Reinstalla dependencies
pip3 install -r requirements.txt --force-reinstall
```

### Wizard non parte
```bash
# Verifica permessi
chmod +x wizard/wizard.py

# Esegui con python3 esplicito
python3 wizard/wizard.py
```

## 🔄 Roadmap

### v2.1 (Prossimo)
- [ ] Supporto Flutter
- [ ] Integration con GitHub Codespaces
- [ ] Template per microservices
- [ ] Multi-language agents (ITA/ENG/ESP)

### v2.2
- [ ] AI-powered code review
- [ ] Automatic refactoring suggestions
- [ ] Performance optimization agent
- [ ] Security audit agent

### v2.3
- [ ] Visual project builder
- [ ] Real-time collaboration
- [ ] Marketplace per template
- [ ] Integration con Figma

## 🤝 Contributing

Contributions sono benvenute!

1. Fork il progetto
2. Crea feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit (`git commit -m 'feat: Add AmazingFeature'`)
4. Push (`git push origin feature/AmazingFeature`)
5. Apri Pull Request

### Aggiungi Nuovo Stack
1. Fork il repo
2. Aggiungi stack in `suggestions/stack_suggestions.json`
3. Crea template agente in `templates/agents/`
4. Testa con wizard
5. Submit PR

## 📄 License

MIT License - vedi [LICENSE](LICENSE) per dettagli.

## 🙏 Acknowledgments

- Ispirato da [Claude Code Agent Teams](https://code.claude.com/docs/en/agent-teams)
- Powered by [OpenCode](https://opencode.ai)
- Community contributors

## 📞 Support

- **Documentation**: [README.md](README.md)
- **Issues**: [GitHub Issues](https://github.com/tuo-username/opencode-agents-2.0/issues)
- **Discussions**: [GitHub Discussions](https://github.com/tuo-username/opencode-agents-2.0/discussions)

---

**Ready to ship 4x faster? Start the wizard! 🚀**

```bash
python3 wizard/wizard.py
```
