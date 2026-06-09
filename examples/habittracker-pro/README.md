# Esempio: HabitTracker Pro

Questo è un esempio di progetto generato dal wizard di OpenCode Agents 2.0.

## Configurazione Wizard

```
? Che tipo di progetto vuoi creare?
> Web Application (SaaS)

? Qual è il nome del progetto?
> HabitTracker Pro

? Descrivi brevemente il tuo progetto:
> App per tracciare abitudini quotidiane con AI recommendations

? Chi sono i tuoi utenti target?
> Persone che vogliono migliorare le proprie abitudini quotidiane

? Quale problema principale risolve?
> Difficoltà a mantenere abitudini costanti senza feedback e motivazione

? Quali feature sono essenziali per la MVP?
✅ Autenticazione utenti (email/password)
✅ Login social (Google, Apple)
✅ Dashboard con statistiche
✅ Tracker abitudini quotidiane
✅ Notifiche push
✅ AI recommendations
✅ Gamification (streak, badges)
✅ Profilo utente

? Hai preferenze tecnologiche?
> Suggerisci tu lo stack ottimale

? Qual è il tuo budget mensile per il deploy?
> $50-100 (Startup, piccolo progetto)

? Quando vorresti lanciare la MVP?
> 1-2 mesi (MVP completa)

? Quante persone lavoreranno al progetto?
> Solo io (solo developer)
```

## Output Generato

### Stack Raccomandato
- **Frontend**: Next.js 14 + TypeScript
- **Backend**: Next.js API Routes + tRPC
- **Database**: PostgreSQL + Prisma
- **Deploy**: Vercel + Railway
- **Auth**: NextAuth.js
- **Payments**: Stripe (per upgrade premium)

### Costo Stimato
$70/mese
- Vercel Pro: $20
- Railway: $30
- Database: $15
- Notifiche: $5

### Tempo Stimato
6 settimane

### Agenti Generati
1. @frontend - Next.js specialist
2. @backend - API + tRPC
3. @database - PostgreSQL + Prisma
4. @qa-engineer - Vitest + Playwright
5. @devops - Vercel + Railway
6. @ai-engineer - Recommendations AI

## Piano di Sviluppo

### Fase 1: Setup & Auth (Settimana 1)
- [x] Setup progetto Next.js + TypeScript
- [x] Database schema (User, Habit, HabitLog)
- [x] Autenticazione NextAuth (email + Google)
- [x] UI base (layout, navbar, theme)

### Fase 2: Core Features (Settimane 2-3)
- [ ] Dashboard con statistiche
- [ ] CRUD abitudini
- [ ] Tracker giornaliero
- [ ] Streak calculation
- [ ] Notifiche base

### Fase 3: Advanced Features (Settimane 4-5)
- [ ] AI recommendations
- [ ] Gamification (badges, livelli)
- [ ] Grafici e visualizzazioni
- [ ] Profilo utente avanzato

### Fase 4: Polish & Launch (Settimana 6)
- [ ] Test E2E completi
- [ ] Performance optimization
- [ ] SEO e metadata
- [ ] Deploy produzione
- [ ] Monitoring setup

## Esempio Prompt

### Prompt 1: Setup Iniziale
```
"Setup progetto completo con:
- Next.js 14 + TypeScript + Tailwind
- PostgreSQL con Prisma
- Autenticazione NextAuth (email + Google)
- Layout base con sidebar e navbar
- Deploy config su Vercel"
```

**Agenti chiamati:**
- @database: Schema Prisma (User, Account, Session)
- @backend: NextAuth config, API routes
- @frontend: Layout, componenti UI base
- @devops: Vercel config, env vars

### Prompt 2: Dashboard
```
"Implementa dashboard utente con:
- Card statistiche (streak attuale, totale abitudini, completion rate)
- Grafico andamento settimanale
- Lista abitudini di oggi con checkbox
- Quick add nuova abitudine
- Widget streak più lungo"
```

**Agenti chiamati:**
- @backend: API per statistiche, query ottimizzate
- @frontend: Componenti dashboard, grafici con Recharts
- @database: Query aggregate per statistiche

### Prompt 3: AI Recommendations
```
"Implementa sistema AI recommendations:
- Analizza pattern abitudini utente
- Suggerisci abitudini correlate
- Ottimizza orari basandosi su completion rate
- Personalizza suggerimenti per obiettivi utente"
```

**Agenti chiamati:**
- @ai-engineer: Modello recommendations, API Python
- @backend: Integration con AI service
- @frontend: UI suggerimenti, feedback loop
- @database: Salvataggio pattern e suggerimenti

## Risultato Finale

Dopo 6 settimane di sviluppo con OpenCode Agents:

✅ **Funzionalità Complete**
- Autenticazione completa (email + social)
- Tracker abitudini con streak
- Dashboard con statistiche
- AI recommendations
- Gamification
- Notifiche push

✅ **Qualità Codice**
- Test coverage: 85%
- TypeScript strict mode
- ESLint + Prettier
- Code review automatizzato

✅ **Deploy**
- Vercel (frontend)
- Railway (backend + database)
- CI/CD con GitHub Actions
- Monitoring con Sentry

✅ **Performance**
- Lighthouse score: 95+
- Load time: <2s
- API response: <200ms

## Metriche

- **Tempo totale sviluppo**: 6 settimane (invece di 12-16 senza AI)
- **Riga di codice generate**: ~15,000
- **Task completati**: 120+
- **Agenti utilizzati**: 6
- **Costo totale**: $420 (6 mesi × $70)
- **ROI**: 4x più veloce rispetto a sviluppo tradizionale

## Prossimi Step

1. Beta testing con 50 utenti
2. Feedback collection
3. Iterazione feature basata su feedback
4. Launch pubblico
5. Marketing e growth

---

**Questo esempio mostra la potenza di OpenCode Agents 2.0!** 🚀
