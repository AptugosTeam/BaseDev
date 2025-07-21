/*
path: emails.tsx
keyPath: elements\Interact\email\emails.tsx
unique_id: DtKksKg1
*/
import nodemailer from 'nodemailer'

const transporter = nodemailer.createTransport({
    {% if element.values.service != 'MailGun' %}
host: "{{ element.values.smpthost|default("smtp.gmail.com") }}",
    port: "{{ element.values.smptport|default("465") }}",
        {% else %}
service: 'Mailgun',
    {% endif %}
auth: {
    user: "{{ element.values.smptuser }}",
        pass: "{{ element.values.smptpass }}",
    }
})

/**
 * Sends an email
 * @param {Object} options - Email options
 * @param {string} options.to - Email recipient
 * @param {string} options.subject - Email subject
 * @param {string} options.text - Plain text content
 * @param {string} options.html - HTML content (optional)
 * @param {string} options.from - Sender (optional, uses default value if not provided)
 * @returns {Promise} - Promise that resolves with sending information
 */

{% set tableName = element.values.emailLogs | friendly | lower %}
export async function sendEmail(db, options) {
    const { to, subject, text, html, from } = options

    try {
        const info = await transporter.sendMail({
            from,
            to,
            subject,
            text,
            html: html || text
        })

        {% if element.values.emailLogs != 'none' %}
            await db.collection('{{ tableName }}').insertOne({
                to,
                subject,
                sentAt: new Date(),
                messageId: info.messageId,
                status: 'sent'
            })
        {% endif %}

        return { success: true, messageId: info.messageId }
    } catch (error) {
        {% if element.values.emailLogs != 'none' %}
        await db.collection('{{ tableName }}').insertOne({
            to,
            subject,
            sentAt: new Date(),
            error: error.message,
            status: 'error'
        })
        {% endif %}

        throw error
    }
}