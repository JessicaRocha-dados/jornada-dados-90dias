import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
import os

# -----------------------------------------------------------------------------
# 1. SETUP & IDENTIDADE VISUAL OLIST (PREMIUM)
# -----------------------------------------------------------------------------
st.set_page_config(
    page_title="Olist Executive View",
    layout="wide",
    initial_sidebar_state="collapsed"
)

# A MÁGICA DO CSS (Design System Olist)
st.markdown("""
<style>
    /* Importando fonte moderna (Roboto/Inter style) */
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap');

    html, body, [class*="css"] {
        font-family: 'Inter', sans-serif;
    }

    /* Fundo Clean */
    .stApp { background-color: #F8F9FA; }
    
    /* Cabeçalho Laranja no Topo */
    header[data-testid="stHeader"] {
        background-image: linear-gradient(90deg, #E48F45, #FFB070);
    }

    /* CARTÕES DE KPI (O Pulo do Gato) */
    div[data-testid="stMetric"] {
        background-color: #FFFFFF;
        border: none;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08); /* Sombra suave */
        border-left: 6px solid #E48F45; /* Borda Laranja Olist */
        transition: transform 0.2s;
    }
    div[data-testid="stMetric"]:hover {
        transform: translateY(-5px); /* Efeito de subir ao passar o mouse */
    }

    /* Títulos */
    h1, h2, h3 { color: #2C3E50; letter-spacing: -0.5px; }
    
    /* Ajuste de Margens */
    .block-container { padding-top: 2rem; padding-bottom: 3rem; }
</style>
""", unsafe_allow_html=True)

# -----------------------------------------------------------------------------
# 2. CARREGAMENTO DOS DADOS
# -----------------------------------------------------------------------------


@st.cache_data
def carregar_dados():
    pasta_atual = os.path.dirname(os.path.abspath(__file__))
    caminho_arquivo = os.path.join(pasta_atual, "vendas.csv")
    try:
        df = pd.read_csv(caminho_arquivo)
        df['data_venda'] = pd.to_datetime(df['data_venda'])
        df['categoria'] = df['categoria'].fillna('Outros')
        return df
    except:
        return None


df_raw = carregar_dados()
if df_raw is None:
    st.stop()

# -----------------------------------------------------------------------------
# 3. SIDEBAR (FILTROS)
# -----------------------------------------------------------------------------
with st.sidebar:
    st.markdown("### 🔍 Filtros de Análise")

    # Data
    min_d, max_d = df_raw['data_venda'].min(), df_raw['data_venda'].max()
    periodo = st.date_input("Período", [min_d, max_d])

    # Estado
    estados = sorted(df_raw['estado'].unique())
    sel_estados = st.multiselect(
        "Filtrar Estados", estados, default=estados[:3])

    st.markdown("---")
    st.caption("Powered by **Streamlit & Plotly**")

# Aplicar Filtros
if len(periodo) == 2:
    df = df_raw[(df_raw['data_venda'] >= pd.to_datetime(periodo[0]))
                & (df_raw['data_venda'] <= pd.to_datetime(periodo[1]))]
else:
    df = df_raw

if sel_estados:
    df = df[df['estado'].isin(sel_estados)]

# -----------------------------------------------------------------------------
# 4. STORYTELLING: CABEÇALHO E NARRATIVA
# -----------------------------------------------------------------------------
st.title(" Performance Comercial Olist")

# Texto dinâmico (Storytelling Real)
faturamento = df['valor_venda'].sum()
top_cat = df.groupby('categoria')['valor_venda'].sum().idxmax().title()
melhor_dia = df.groupby('data_venda')[
    'valor_venda'].sum().idxmax().strftime('%d/%m')

st.markdown(f"""
<div style='background-color: #fff; padding: 15px; border-radius: 10px; border: 1px solid #eee; margin-bottom: 20px;'>
    <span style='font-size: 16px; color: #555;'>
    📊 <b>Resumo Executivo:</b> No período selecionado, atingimos um faturamento total de 
    <b style='color: #E48F45;'>R$ {faturamento:,.2f}</b>. 
    O destaque principal vai para a categoria <b>{top_cat}</b>, que lidera as vendas. 
    Nosso pico de vendas ocorreu no dia <b>{melhor_dia}</b>.
    </span>
</div>
""", unsafe_allow_html=True)

# -----------------------------------------------------------------------------
# 5. KPIs (ESTILO CARTÃO)
# -----------------------------------------------------------------------------
col1, col2, col3, col4 = st.columns(4)

pedidos = df['order_id'].nunique()
ticket = df['valor_venda'].mean()
frete_medio = df['valor_frete'].mean()

# Função para formatar bonito


def fmt(valor, prefix=""):
    s = f"{prefix} {valor:,.2f}" if isinstance(valor, float) else f"{valor}"
    return s.replace(",", "X").replace(".", ",").replace("X", ".")


with col1:
    st.metric("Receita Total", fmt(faturamento, "R$"), "Principal KPI")
with col2:
    st.metric("Total Pedidos", fmt(pedidos), "Volume")
with col3:
    st.metric("Ticket Médio", fmt(ticket, "R$"), "Média/Pedido")
with col4:
    st.metric("Frete Médio", fmt(frete_medio, "R$"), "Logística")

st.markdown("###")

# -----------------------------------------------------------------------------
# 6. GRÁFICOS (VISUAL OLIST)
# -----------------------------------------------------------------------------

# LINHA 1: TENDÊNCIA (LARANJA) + MAPA (ROXO)
c_chart1, c_chart2 = st.columns([2, 1])

with c_chart1:
    st.subheader("📈 Evolução Financeira (Sazonalidade)")

    # Dados
    try:
        df_time = df.set_index('data_venda').resample(
            'ME')['valor_venda'].sum().reset_index()
    except:
        df_time = df.set_index('data_venda').resample(
            'M')['valor_venda'].sum().reset_index()

    # Gráfico de Área Laranja (Identidade Visual)
    fig = px.area(df_time, x='data_venda',
                  y='valor_venda', template='plotly_white')

    # AQUI ESTÁ O SEGREDO DO LARANJA
    fig.update_traces(line_color='#E48F45',
                      fillcolor='rgba(228, 143, 69, 0.3)')
    fig.update_layout(
        plot_bgcolor='rgba(0,0,0,0)',
        xaxis_title=None,
        yaxis_title=None,
        yaxis=dict(showgrid=True, gridcolor='#f0f0f0'),
        height=380
    )
    st.plotly_chart(fig, use_container_width=True)

with c_chart2:
    st.subheader("🏆 Top Estados")
    df_est = df.groupby('estado')['valor_venda'].sum(
    ).sort_values(ascending=True).tail(7)

    # Gráfico de Barras Roxo (Contraste)
    fig2 = px.bar(df_est, x='valor_venda', y=df_est.index,
                  orientation='h', text_auto='.2s', template='plotly_white')
    fig2.update_traces(marker_color='#5D4A66')  # Roxo Olist
    fig2.update_layout(
        plot_bgcolor='rgba(0,0,0,0)',
        xaxis=dict(showgrid=False, showticklabels=False),
        yaxis_title=None,
        xaxis_title=None,
        height=380
    )
    st.plotly_chart(fig2, use_container_width=True)

# LINHA 2: DETALHAMENTO DE CATEGORIA
st.subheader("📦 Performance por Categoria (Curva Pareto)")

df_cat = df.groupby('categoria')['valor_venda'].sum(
).sort_values(ascending=False).head(15)

# Gráfico de Barras com Gradiente Laranja
fig3 = px.bar(
    df_cat,
    x=df_cat.index,
    y='valor_venda',
    color='valor_venda',
    color_continuous_scale=['#FFDbb5', '#E48F45',
                            '#BA6520'],  # Gradiente Laranja Customizado
    template='plotly_white'
)
fig3.update_layout(
    plot_bgcolor='rgba(0,0,0,0)',
    xaxis_title=None,
    yaxis=dict(showgrid=True, gridcolor='#f0f0f0'),
    coloraxis_showscale=False,  # Esconde a barra de cores lateral
    height=350
)
st.plotly_chart(fig3, use_container_width=True)
