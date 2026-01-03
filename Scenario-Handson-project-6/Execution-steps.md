## Step-by-Step Execution Guide

1️⃣ Clone the Repository
```
git clone <your-repo-url>
cd Scenario-Handson-project-6
```
2️⃣ Make Scripts Executable
```
chmod +x scripts/setup.sh
chmod +x scripts/test_dashboard.sh
chmod +x scripts/cleanup.sh
```

3️⃣ Install Netdata
```
scripts/setup.sh
```

4️⃣ Verify Netdata Service
```
sudo systemctl status netdata
```

✅ Expected: active (running)

5️⃣ Access Dashboard
```
http://localhost:19999
```

or
```
http://<server-ip>:19999
```

6️⃣ Configure CPU Alert
```
sudo cp netdata/cpu_alert.conf /etc/netdata/health.d/
sudo systemctl restart netdata
```

7️⃣ Test Monitoring
```
scripts/test_dashboard.sh
```
8️⃣ Check Alerts
```
sudo journalctl -u netdata
```
9️⃣ Cleanup (Optional)
```
scripts/cleanup.sh
```
