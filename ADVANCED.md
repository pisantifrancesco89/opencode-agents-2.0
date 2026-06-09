# Guida Avanzata - OpenCode Agents 2.0

## 🎯 Workflow Avanzato

### 1. Multi-Project Setup

Puoi usare OpenCode Agents per gestire più progetti contemporaneamente:

```bash
# Progetto 1: SaaS
cd ~/projects/saas-app
python3 ~/opencode-agents-2.0/wizard/wizard.py

# Progetto 2: Mobile
cd ~/projects/mobile-app
python3 ~/opencode-agents-2.0/wizard/wizard.py

# Ogni progetto ha il suo setup personalizzato
```

### 2. Template Custom

Crea template personalizzati per il tuo team:

```bash
# Crea template custom
mkdir -p templates/agents/my-company

# Template frontend con convenzioni aziendali
cat > templates/agents/my-company/frontend.md << 'EOF'
# Frontend Developer Agent - MyCompany

## Stack
- Next.js 14 + TypeScript
- Tailwind CSS + shadcn/ui
- Zustand per state management

## Convenzioni Aziendali
- Usa sempre i componenti da @mycompany/ui
- Segui il design system in docs/design-system.md
- Test coverage minimo 85%
- Code review obbligatorio con 2 approvazioni
EOF
```

### 3. Agenti Custom

Aggiungi agenti specializzati per il tuo dominio:

```bash
# Crea agente custom
cat > .opencode/agents/blockchain.md << 'EOF'
# Blockchain Developer Agent

## Ruolo
Sei uno specialista in sviluppo blockchain e smart contracts.

## Stack
- Solidity
- Hardhat
- Ethers.js
- The Graph

## Responsabilità
- Smart contracts
- Integration web3
- Gas optimization
- Security audit
EOF
```

### 4. Piano Sviluppo Custom

Modifica il piano generato:

```bash
# Apri PLAN.md
nano PLAN.md

# Aggiungi fasi custom
## Fase 6: Blockchain Integration
- [ ] Smart contract deployment
- [ ] Web3 integration
- [ ] Wallet connection
```

## 🔧 Configurazione Avanzata

### Variabili Ambiente Wizard

```bash
# Usa stack specifico
export OPENCODE_DEFAULT_STACK="nextjs"
python3 wizard/wizard.py

# Lingua italiana
export OPENCODE_LANGUAGE="it"
python3 wizard/wizard.py

# Modalità verbose
export OPENCODE_VERBOSE="true"
python3 wizard/wizard.py
```

### Config File

Crea `.opencode-config.json` nella root del progetto:

```json
{
  "default_stack": "nextjs",
  "language": "it",
  "agents": {
    "include": ["frontend", "backend", "database"],
    "exclude": ["devops"]
  },
  "custom_templates": "./templates/agents/my-company",
  "plan_phases": 6
}
```

### Integration con CI/CD

```yaml
# .github/workflows/setup.yml
name: Project Setup
on: [workflow_dispatch]
jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - run: pip install -r requirements.txt
      - run: python3 wizard/wizard.py --non-interactive
        env:
          PROJECT_NAME: ${{ github.event.inputs.project_name }}
          PROJECT_TYPE: ${{ github.event.inputs.project_type }}
```

## 📊 Analytics e Metriche

### Traccia Utilizzo Agenti

```bash
# Log attività agenti
cat > .opencode/agent-usage.json << 'EOF'
{
  "agents_called": {
    "frontend": 15,
    "backend": 12,
    "database": 8,
    "qa-engineer": 10,
    "devops": 5
  },
  "tasks_completed": 50,
  "time_saved_hours": 120
}
EOF
```

### Report Performance

```python
# scripts/generate_report.py
import json
from datetime import datetime

def generate_report():
    with open('.opencode/agent-usage.json') as f:
        data = json.load(f)
    
    print("📊 Report Performance Agenti")
    print(f"Data: {datetime.now().strftime('%Y-%m-%d')}")
    print(f"\nAgenti più usati:")
    for agent, count in sorted(data['agents_called'].items(), key=lambda x: x[1], reverse=True):
        print(f"  @{agent}: {count} task")
    
    print(f"\nTask completati: {data['tasks_completed']}")
    print(f"Tempo risparmiato: {data['time_saved_hours']} ore")

if __name__ == "__main__":
    generate_report()
```

## 🎨 Pattern di Utilizzo Avanzati

### Pattern 1: Feature Flag

Implementa feature con flag per rollout graduale:

```
"Implementa sistema notifiche con feature flag:
- Flag 'notifications_v1' per versione base
- Flag 'notifications_v2' per versione avanzata
- Admin panel per gestire flag
- A/B testing per engagement"
```

### Pattern 2: Microservices

Dividi il progetto in microservizi:

```
"Architettura microservices per e-commerce:
- Service: auth-service (Node.js)
- Service: product-service (Python)
- Service: order-service (Go)
- Service: payment-service (Node.js)
- API Gateway (Kong)
- Message Queue (RabbitMQ)"
```

### Pattern 3: Event-Driven

Implementa architettura event-driven:

```
"Sistema event-driven per real-time updates:
- Event bus con Redis Streams
- Event sourcing per audit trail
- CQRS per read/write separation
- WebSocket per notifiche real-time"
```

### Pattern 4: AI Pipeline

Crea pipeline AI completa:

```
"Pipeline AI per recommendations:
- Data collection (user behavior)
- Data preprocessing (cleaning, normalization)
- Model training (collaborative filtering)
- Model serving (FastAPI)
- A/B testing framework
- Monitoring e retraining automatico"
```

## 🔐 Security Best Practices

### 1. Secrets Management

```bash
# Non committare mai secrets
echo ".env" >> .gitignore
echo ".env.*" >> .gitignore

# Usa variabili ambiente
export DATABASE_URL="postgresql://..."
export NEXTAUTH_SECRET="..."
```

### 2. Agent Permissions

Limita permessi agenti:

```markdown
# .opencode/agents/backend.md

## Permissions
- ✅ Read/Write: server/routers/
- ✅ Read/Write: lib/
- ❌ No access: .env files
- ❌ No access: secrets/
- ❌ No deploy permissions
```

### 3. Code Review

```bash
# Pre-commit hook per security scan
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Scan for secrets
if git diff --cached | grep -E "(password|secret|key|token)" | grep -v "example"; then
    echo "❌ Potential secret detected!"
    exit 1
fi
EOF
chmod +x .git/hooks/pre-commit
```

## 📈 Scaling

### 1. Multi-Team Setup

```bash
# Team frontend
.opencode/teams/frontend/
  orchestrator.md
  agents/
    frontend.md
    ui-ux.md

# Team backend
.opencode/teams/backend/
  orchestrator.md
  agents/
    backend.md
    database.md

# Team mobile
.opencode/teams/mobile/
  orchestrator.md
  agents/
    mobile.md
    api.md
```

### 2. Enterprise Features

```json
{
  "enterprise": {
    "sso": true,
    "audit_log": true,
    "compliance": ["SOC2", "GDPR", "HIPAA"],
    "monitoring": {
      "datadog": true,
      "sentry": true,
      "pagerduty": true
    }
  }
}
```

### 3. Performance Optimization

```bash
# Cache agent responses
mkdir -p .opencode/cache

# Parallel agent execution
export OPENCODE_PARALLEL="true"

# Agent timeout
export OPENCODE_TIMEOUT="300"
```

## 🧪 Testing

### Test Wizard

```bash
# Test interattivo
python3 wizard/wizard.py

# Test non-interattivo (CI/CD)
python3 wizard/wizard.py --non-interactive \
  --project-name "Test Project" \
  --project-type "Web Application" \
  --stack "nextjs"
```

### Test Agenti

```bash
# Test singolo agente
python3 scripts/test_agent.py frontend

# Test tutti gli agenti
python3 scripts/test_agents.py

# Test integration
python3 scripts/test_integration.py
```

## 📚 Risorse

### Documentazione
- [README.md](./README.md) - Guida principale
- [USAGE.md](./USAGE.md) - Guida utilizzo
- [STACKS-INDEX.md](./STACKS-INDEX.md) - Stack supportati
- [ADVANCED.md](./ADVANCED.md) - Questa guida

### Community
- [GitHub Discussions](https://github.com/tuo-username/opencode-agents-2.0/discussions)
- [Discord Server](https://discord.gg/opencode)
- [Twitter](https://twitter.com/opencode)

### Video Tutorial
- [Quick Start (5 min)](https://youtube.com/watch?v=...)
- [Advanced Features (15 min)](https://youtube.com/watch?v=...)
- [Enterprise Setup (30 min)](https://youtube.com/watch?v=...)

## 🔄 Migration da 1.0

Se hai già progetti con OpenCode Agents 1.0:

```bash
# Backup setup esistente
cp -r .opencode .opencode.backup

# Esegui wizard 2.0
python3 ~/opencode-agents-2.0/wizard/wizard.py

# Merge configurazioni
# Il wizard mantiene le personalizzazioni esistenti
```

## 🎓 Certification

Diventa un OpenCode Agents Expert:

1. Completa 10 progetti con il wizard
2. Crea 3 template custom
3. Contribuisci alla community
4. Ottieni certificazione: [certification.opencode.ai](https://certification.opencode.ai)

---

**Ready for advanced usage? 🚀**
