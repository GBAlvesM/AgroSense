const int PINO_SENSOR_UMIDADE_SOLO = A5;

void setup() {
  Serial.begin(9600);
  pinMode(PINO_SENSOR_UMIDADE_SOLO, INPUT);
}

void loop() {
  int leituraSensor = analogRead(PINO_SENSOR_UMIDADE_SOLO);

  float porcentagemUmidade = 100 - (leituraSensor / 1023.0) * 100;

  Serial.println(porcentagemUmidade);

  delay(2000);
}

