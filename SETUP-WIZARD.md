# 🧙 Setup Wizard - Istruzioni per l'AI

Quando l'utente dice "voglio creare un nuovo progetto" o "setup wizard", segui questo processo ESATTO.

## FASE 1: Domande (una alla volta)

Fai queste domande UNA ALLA VOLTA, aspettando la risposta dell'utente prima di passare alla successiva. Per ogni domanda, suggerisci anche le opzioni migliori.

### Domanda 1: Tipo di progetto
```
Che tipo di progetto vuoi creare?

1. Web Application (SaaS) ← più comune, consigliato
2. E-commerce
3. Mobile App
4. API Backend
5. AI/ML Application
6. Marketplace
7. Social Network
8. Dashboard/Analytics
9. Desktop App
10. CLI Tool
```

### Domanda 2: Nome e descrizione
```
Come si chiama il progetto e cosa fa? (descrivi in 1-2 frasi)
```

### Domanda 3: Target utenti
```
Chi sono gli utenti target? (es: "freelance che vogliono gestire i clienti")
```

### Domanda 4: Feature principali
```
Quali sono le 5-8 feature essenziali per la MVP?

Te ne suggerisco alcune in base al tipo di progetto:
[suggerisci 10-15 feature rilevanti per il tipo scelto]

Scegline 5-8 o scrivi le tue.
```

### Domanda 5: Preferenze tecniche
```
Hai preferenze tecnologiche?

1. Suggerisci tu lo stack ottimale ← consigliato
2. JavaScript/TypeScript (Next.js, React, Node.js)
3. Python (FastAPI, Django)
4. Go
5. Rust
6. Java (Spring Boot)
7. PHP (Laravel)
8. Mobile (React Native, Flutter)
9. Custom (specifica)
```

### Domanda 6: Budget
```
Qual è il tuo budget mensile per il deploy?

1. $0-50 (Free tier, hobby) ← per iniziare
2. $50-100 (Startup, piccolo progetto) ← consigliato
3. $100-300 (Business, medio progetto)
4. $300-1000 (Enterprise)
```

### Domanda 7: Timeline
```
Quando vorresti lanciare la MVP?

1. 2-4 settimane (MVP minimale)
2. 1-2 mesi (MVP completa) ← consigliato
3. 3-6 mesi (Prodotto completo)
4. 6+ mesi (Enterprise)
```

## FASE 2: Analisi e Suggerimenti

Dopo aver raccolto tutte le risposte:

1. **Determina lo stack ottimale** basandoti su:
   - Tipo di progetto
   - Feature richieste
   - Preferenze utente
   - Budget

2. **Determina gli agenti necessari**:
   - Base: frontend, backend, database, qa-engineer, devops
   - Specializzati: mobile (se mobile app), ai-engineer (se AI features), payments (se pagamenti)

3. **Mostra un riepilogo**:
```
📊 Riepilogo Progetto
━━━━━━━━━━━━━━━━━━━━
Nome: [nome]
Tipo: [tipo]
Stack: [frontend] + [backend] + [database]
Deploy: [deploy]
Budget: $X/mese
Timeline: X settimane
Agenti: @frontend, @backend, @database, @qa-engineer, @devops

Procedo con la generazione? (sì/no/modifica)
```

## FASE 3: Generazione File

Se l'utente conferma, genera TUTTI questi file nella directory del progetto:

### 1. `.opencode/orchestrator.md`
Contiene:
- Nome progetto e descrizione
- Stack tecnologico completo
- Lista agenti disponibili
- Regole di orchestrazione
- Processo di lavoro

### 2. `.opencode/agents/[nome].md` (uno per ogni agente)
Ogni agente contiene:
- Ruolo specifico per questo progetto
- Stack tecnologico rilevante
- Responsabilità nel contesto del progetto
- Convenzioni specifiche
- Pattern comuni per questo stack
- Output atteso

### 3. `CLAUDE.md`
Contiene:
- Panoramica progetto
- Stack tecnologico
- Feature MVP
- Struttura directory
- Comandi utili
- Convenzioni

### 4. `PLAN.md`
Contiene:
- Timeline e budget
- Fasi di sviluppo (5 fasi)
- Task dettagliati per ogni fase
- Metriche di successo
- Prossimi step

### 5. `.env.example`
Contiene:
- Variabili per il database
- Variabili auth
- Variabili payments (se serve)
- Variabili storage
- Variabili app

### 6. `README.md`
Contiene:
- Descrizione progetto
- Quick start
- Features
- Tech stack
- AI team info
- Documentation links

## FASE 4: Kickoff

Dopo la generazione:
```
✅ Progetto generato con successo!

File creati:
  ✅ .opencode/orchestrator.md
  ✅ .opencode/agents/[X agenti].md
  ✅ CLAUDE.md
  ✅ PLAN.md
  ✅ .env.example
  ✅ README.md

🎯 Per iniziare:
  1. Leggi PLAN.md per la roadmap
  2. Dimmi "Iniziamo con la Fase 1" per partire
  3. Io chiamerò gli agenti necessari in parallelo
```

## STACK DATABASE

Usa questa tabella per determinare lo stack:

| Tipo Progetto | Frontend | Backend | Database | Deploy | Auth |
|--------------|----------|---------|----------|--------|------|
| SaaS | Next.js 14 + TS | Next.js API + tRPC | PostgreSQL + Prisma | Vercel + Railway | NextAuth |
| E-commerce | Next.js 14 + TS | Next.js API | PostgreSQL + Prisma | Vercel + Railway | NextAuth + Stripe |
| Mobile | React Native + Expo | Node.js + Express | PostgreSQL + Prisma | Railway + Expo | Expo Auth |
| API Backend | N/A | FastAPI + Python | PostgreSQL + SQLAlchemy | Railway | JWT + OAuth2 |
| AI/ML | Next.js + TS | FastAPI + Python | PostgreSQL + pgvector | Railway + Modal | NextAuth |
| Marketplace | Next.js 14 + TS | Next.js API | PostgreSQL + Prisma | Vercel + Railway | NextAuth + Stripe Connect |
| Social | Next.js 14 + TS | Next.js + Socket.io | PostgreSQL + Redis | Vercel + Railway | NextAuth |
| Dashboard | Next.js + Recharts | Next.js API | PostgreSQL + Prisma | Vercel + Railway | NextAuth |

## REGOLE IMPORTANTI

1. **UNA domanda alla volta** - Non fare mai più domande insieme
2. **Suggerisci sempre** le opzioni migliori (marca con ← consigliato)
3. **Adatta le feature** suggerite al tipo di progetto specifico
4. **Mostra il riepilogo** prima di generare
5. **Chiedi conferma** prima di creare i file
6. **Genera TUTTI i file** in una volta
7. **Usa il nome del progetto** ovunque (non "TestProject")
8. **Sii specifico** negli agenti (non generici, ma tailored al progetto)
